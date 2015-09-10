class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    domain = request.env["omniauth.auth"].info.email.split("@")[1].split(".")[0]
    hasFamily = request.env["omniauth.auth"].info.email.include? "family"
    unless (domain == "ncssm" or domain == "baileyb") and !hasFamily
      redirect_to root_path, notice: "An NCSSM student account is required to log in."
      return
    end
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.find_for_google_oauth2(request.env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Google"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.google_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end
