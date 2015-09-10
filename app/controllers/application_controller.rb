class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def filter_admin
    redirect_to root_path, notice: "You must be an administrator to view this resource." unless user_signed_in? and current_user.admin?
  end
end
