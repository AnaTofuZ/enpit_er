class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user    ||= User.find(session[:user_id])
      @items   ||= Item.where(user_id: @user)
    else
      @counter ||= access_counter_show
      @usersum ||= usersum
    end
  end

  def help
   access_counter_increment
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
      @user = current_user
  end

  def recipe
    @placeName = params[:placeName]
    @usersId = params[:user_id]
  end
  def community
    @placeName = params[:placeName]
    @usersId = params[:usersId]
  end

  def mailbox
  end

  def map
  end

  def about
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

  def access_counter_increment
     CommunityCounter.increment_counter(:counter,1)
     counters = CommunityCounter.find(1)
     @counter =  counters.counter
  end

  def access_counter_show
     counters = CommunityCounter.find(1)
     @counter =  counters.counter
  end

  def usersum
     @usersum = User.count
  end
end
