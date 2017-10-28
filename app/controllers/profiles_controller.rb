class ProfilesController < ApplicationController
  def new
    @user = user

    if @user.nil?
      flash[:notice] = "ログインしてくれ!"
#      redirect_to action: 'index'
      redirect_to controller: 'sessions', action: 'new'
    end

  end


  private

  def user
    @user ||= User.find_by(id: session[:user_id])
  end
end
