class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
#  devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  def twitter
    authorization
  end

  def passthru
     super
   end
#
  private
  def authorization
    if current_user
      user = user.omniauth request.env["omniauth.auth"] 
    else
      user = User.from_omniauth request.env["omniauth.auth"]
    end

    if user.persisted?
        set_flash_message(:notice,:success,:kid => "Twitter") if is_navigational_format?
        sign_in_and_redirect @user, :event => :authentication
      else
        session["devise.twitter_data"] = request.env["omniauth.auth"].except("extra")
        redirect_to new_user_registration_url
    end
  end


  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
