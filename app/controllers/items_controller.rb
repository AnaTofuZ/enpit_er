class ItemsController < ApplicationController
  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @item = Item.new(item_param)
    if @item.save
      flash[:success] = "食材の登録が完了しました！"
      redirect_to root_url
    else
      flash[:fail] = "食材の登録が完了しました！"
      redirect_to root_url
    end
  end

  def show
    @user = User.find(session[:user_id])
    @item = @user.item
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def item_param
    params.require(:item).permit(:food).merge({user_id: current_user.id})
  end
end
