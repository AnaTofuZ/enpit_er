class ProfilesController < ApplicationController
  before_action :logged_in_user,except: [:destroy]
  def new
    @user = user
  end

def create
end

  private

  def user
    @user ||= User.find_by(id: session[:user_id])
  end

  def prof_param
     params.require(:profile).permit(:place)
  end

  def logged_in_user
      unless logged_in?
      flash[:notice] = "ログインしてくれ!"
      redirect_to controller: 'sessions', action: 'new'
      end
  end
end
