class ProfilesController < ApplicationController
  def new
    @user ||= User.find_by(id: session[:user_id])
  end
end
