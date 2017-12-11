class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    unless @user.profile.nil?
      redirect_to root_path
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "レシコミに登録されました！"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

   def user_params
     params.require(:user).permit(:name, :email,:password,
                              :password_confirmation,:screen_name)
   end

   def correct_user
     @user = User.find(params[:id])
     redirect_to(root_url) unless current_user?(@user)
   end

end
