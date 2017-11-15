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
      flash[:fail] = "食材の登録に失敗しました"
      redirect_to root_url
    end
  end

  def show
    @user = User.find(session[:user_id])
    @item = @user.item
  end

  def destroy
    @item_id = Item.find_by(id: params[:id],user_id: params[:user_id])
    @item_id.destroy
    flash[:success] = "食品が削除されました．"
    redirect_to root_url
  end

  def index
    @item = Item.all
  end

  def current_user
    @user ||= User.find_by(id: session[:user_id])
  end

  def item_param
    params.require(:item).permit(:food).merge({user_id: current_user.id})
  end
end
