# coding: utf-8
class ProfilesController < ApplicationController
  before_action :logged_in_user,except: [:create,:destroy]
  def new
    @user = user
   if @user.profile
      redirect_to profile_url
   else
       user.build_profile
    end
  end

def create
   @user = user
   if @profile = @user.create_profile(profile_param)
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

def edit
    @user ||= User.find_by(id: session[:user_id])
end


  private


  def user
    @user ||= User.find_by(id: session[:user_id])
  end

  def profile_param
     params.require(:profile).permit(:place_id,:sex,:job,:hobby,:purpose)
  end

end
