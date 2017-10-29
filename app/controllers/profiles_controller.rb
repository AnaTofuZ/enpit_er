class ProfilesController < ApplicationController
  before_action :logged_in_user,except: [:create,:destroy]
  def new
    @user = user
    user.build_profile
  end

def create
   @user = user
   @profile = user.build_profile(profile_param)
   if @profile.save
      flash[:success] = "プロフィールの登録が完了しました!"
      redirect_to root_url
   else
      redirect_to root_url
   end
end

def show
   @user = User.find(session[:user_id])
   @profile = @user.profile
end



  private

  def user
    @user ||= User.find_by(id: session[:user_id])
  end

  def profile_param
     params.require(:profile).permit(:place_id)
  end

end
