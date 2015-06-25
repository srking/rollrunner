class User < ActiveRecord::Base
    devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable,
    omniauth_providers: [:google_oauth2]

    def self.from_omniauth(auth)
        if user = User.find_by_email(auth.info.email)
            user.provider = auth.provider
            user.uid = auth.uid
            user.email = auth.info.email
            user.given_name = auth.extra.raw_info[:given_name]
            user.family_name = auth.extra.raw_info[:family_name]
            user.domain = auth.extra.raw_info[:hd]
            user
        else
            User.where(:provider => auth.provider, :uid => auth.uid).first_or_create do |user|
                user.provider = auth.provider
                user.uid = auth.uid
                user.email = auth.info.email
                user.given_name = auth.extra.raw_info[:given_name]
                user.family_name = auth.extra.raw_info[:family_name]
                user.domain = auth.extra.raw_info[:hd]
                user.password = Devise.friendly_token[0,20]
            end
        end
    end

end
