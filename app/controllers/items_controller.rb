class ItemsController < ApplicationController
  def new
    @user = current_user
    @item = Item.new
  end

  def create
    @user = current_user
    params[:food].each do |fd|
      raw_params = {item: {food: fd}}
      params = ActionController::Parameters.new(raw_params)
      @item = Item.new(params.require(:item).permit(:food).merge({user_id: @user.id}))
      if @item.save
        flash[:success] = "食材の登録が完了しました！"
      else
        flash[:fail] = "食材の登録に失敗しました"
      end
    end
    redirect_to root_url
    # @item = Item.new(item_param)
    # if @item.save
    #   flash[:success] = "食材の登録が完了しました！"
    #   redirect_to root_url
    # else
    #   flash[:fail] = "食材の登録に失敗しました"
    #   redirect_to root_url
    # end
  end

  def show
    @user = User.find(session[:user_id])
    @item = @user.item
  end

  def destroy
    @item_id = Item.find_by(id: params[:id],user_id: session[:user_id])
    if @item_id.destroy
      flash[:success] = "食品が削除されました．"
      redirect_to root_url
    else
      flash[:fail] = "食材の削除に失敗しました"
      redirect_to root_url
    end    
  end

  def index
    @item = Item.all
  end

  private
  
  # def current_user
  #   @user ||= User.find_by(id: session[:user_id])
  # end

  def item_param
    params.require(:item).permit(:food).merge({user_id: @user.id})
  end
end
