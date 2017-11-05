class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def list
  end

  def friends
      place_id = params[:id]
      # とりあえずの方法としてhelperのshow_placeを使用(plceを今後分ける)
      @place_name = show_place(place_id)
      if @place_name.nil?
         redirect_to root_path
      end

      @users = Profile.where(place_id: place_id)
  end

  def recipe
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


end
