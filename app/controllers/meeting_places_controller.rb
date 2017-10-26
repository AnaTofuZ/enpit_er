class MeetingPlacesController < ApplicationController
  def new
    @meetingplace = MeetingPlaces.new
  end

  # TODO: 場所のDB設定と場所の一覧持ってくる(バリデート?)

  def create
    @meetingplace = MeetingPlaces.new(meetingplace_params)

    if @meetingplace.save
      flash[:success] = "場所の登録を行いました"
      redirect_to @meetingplace_params
    else
      render 'new'
    end

 end

 # user_idから出してくる
 def find_from_user
    MeetingPlaces.find()
 end

 # 変更用のメソッド


  private

  def meetingplace_params
    params.require(:meeting_place).permit(:user_id,:place_id)
  end
end
