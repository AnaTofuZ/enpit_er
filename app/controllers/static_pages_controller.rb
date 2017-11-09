class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def list
  end

  def friends
      place_id = params[:id]
      # とりあえずの方法としてshow_placeを使用(placeを今後分ける可能性がある)
      @place_name = show_place(place_id)

      if @place_name.nil?
         redirect_to root_path
      end

      @profiles = Profile.where(place_id: place_id)
  end

  def recipe
      @users = find_users(friends_form[:users])
      if @users.nil?
         redirect_to root_path
      end
  end

  def mailbox
  end

  def map
  end


  private

  def show_place(place_id)
      case place_id.to_i
      when 1 then
         "琉大工学部"
      when 2 then
         "北口ローソン"
      when 3 then
         "キリ学"
      else
         nil
      end
  end

  def friends_form
     params.require(:friends_form).permit(users:[])
  end

  def find_users(users_id)
     @users ||=  User.where id: users_id
  end


end
