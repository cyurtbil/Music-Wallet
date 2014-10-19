class User < ActiveRecord::Base
  attr_accessor :login
  has_many :wallets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :validatable, authentication_keys: [:login]
         :omniauthable, omniauth_providers: [:soundcloud]

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
       user.provider = auth.provider
       user.uid = auth.uid
       # user.email = auth.info.email
       user.password = Devise.friendly_token[0,20]
     end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.soundcloud_data"] && session["devise.soundcloud_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

end
