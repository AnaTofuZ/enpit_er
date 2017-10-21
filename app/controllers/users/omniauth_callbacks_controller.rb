class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
#  devise :omniauthable, omniauth_providers: [:twitter]

def twitter
  @user = User.from_omniauth(request.env["omniauth.auth"].except("extra"))

  if @user.persisted?
      sign_in_and_redirect @user
  else
      @user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
      session["devise.user_attributes"] = @user.attributes
      redirect_to new_user_registration_url
  end
end

  # You should also create an action method in this controller like this:

  def passthru
     super
   end
#
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
