class SessionsController < ApplicationController
  def new
  end

  def create
    login_key = params[:session][:login_key]
     user = ""
     if login_key =~ /@/
       user = User.find_by(email: params[:session][:login_key])
     else
       user = User.find_by(screen_name: params[:session][:login_key])
     end

    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
    else
      flash.now[:danger] = 'メールアドレス,レシコミIDのいずれかか, パスワードが間違っています'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
