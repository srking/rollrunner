class User < ActiveRecord::Base
    belongs_to :domain
    has_many :orders, foreign_key: :owner_id, dependent: :destroy
    has_many :rolls, dependent: :destroy

    devise :database_authenticatable, :registerable, :omniauthable,
    :recoverable, :rememberable, :trackable, :validatable,
    omniauth_providers: [:google_oauth2]

    def self.from_omniauth(auth)
      if user = User.find_by_email(auth.info.email)
        user
      elsif domain_name = auth.extra.raw_info[:hd]
        @domain = Domain.where(:name => domain_name).first_or_create do |domain|
          domain.name = domain_name
        end
        User.where(:provider => auth.provider, :uid => auth.uid).first_or_create do |user|
          user.domain = @domain
          configure_user_from_auth(user, auth)
          user.password = Devise.friendly_token[0,20]
        end
      else
        User.create
      end
    end

    private

    def self.configure_user_from_auth(user, auth)
      user.uid = auth.uid
      user.provider = auth.provider
      user.email = auth.info.email
      user.given_name ||= auth.extra.raw_info[:given_name]
      user.family_name ||= auth.extra.raw_info[:family_name]
    end

end
