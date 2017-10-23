class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,:omniauthable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauth_providers => [:twitter]
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    return  user if user
      user = User.create(name:     auth.info.nickname,
                         provider: auth.provider,
                         uid:      auth.uid,
                         email:    User.create_unique_email,
                         password: Devise.friendly_token[0,20]
                        )
    user
  end

  def self.find_or_create_from_auth_hash(auth)
    #OmniAuthで取得した各データを代入していく
        provider  = auth[:provider]
        uid       = auth[:uid]
        name      = auth[:info][:nickname]
        image     = auth[:info][:image]
    
        User.find_or_create_by(provider: provider, uid: uid) do |user|
          user.name  = name
          user.image = image
        end
  end


  def self.from_omniauth(auth)
    find_or_create_by(provider: auth["provider"], uid: auth["uid"]) do |user|
      user.provider = auth["provider"]
      user.uid      = auth["uid"]
      user.name     = auth["info"]["nickname"]
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"]) do |user|
        user.attributes = params
      end
    else
      super
    end
  end
end
