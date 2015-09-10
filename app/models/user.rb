class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  devise :omniauthable, :omniauth_providers => [:google_oauth2]

  has_many :ballots


  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      User.any? ? admin = false : admin = true
      email = data["email"]
      email =~ /\d{2}/ ? year = email.scan(/\d{2}/)[0].to_i : year = 100
      user = User.create(
        email: data["email"],
        password: Devise.friendly_token[0,20],
        admin: admin,
        year: year
        )
      end
    user
  end

end
