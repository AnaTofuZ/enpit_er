class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(screen_name: params[:session][:screen_name])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = '利用できない組み合わせです．'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
