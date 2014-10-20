class User < ActiveRecord::Base
  # attr_accessor :username
  has_many :wallets
  has_many :songs

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:soundcloud]

   def self.from_omniauth(auth)
     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     		user.email = 'blank@example.com'
      	user.provider = auth.provider
      	user.uid = auth.uid
      	user.username = auth.info.nickname
        user.image = auth.info.image
      	user.password = Devise.friendly_token[0,20]
     end
  end

 # def self.find_first_by_auth_conditions(warden_conditions)
 #  conditions = warden_conditions.dup
 #  if username = conditions.delete(:username)
 #    where(conditions).where(["lower(username) = :value", { value: username.downcase }]).first
 #  else
 #    where(conditions).first
 #  end
 # end

  def self.new_with_session(params, session)
    super.tap do |user|
    	# binding.pry
      if data = session["devise.soundcloud_data"] && session["devise.soundcloud_data"]["extra"]["raw_info"]
        user.username = data["username"] if user.username.blank?
      end
    end
  end

end
