class ItemsController < ApplicationController
  def new
    @user = user
    user.build_items
  end

  def create
    @user = user
    if @item = @user.create_item(item_param)
      flach[:success] = "食材の登録が完了しました！"
      redirect_to root_url
    else
      redirect_to root_url
    end
  end

  def show
    @user = User.find(session[:user_id])
    @item = @user.item
  end

  def user
    @user ||= User.find_by(id: session[:user_id])
  end

  def item_param
    params.require(:item).permit(:food)
  end
end
