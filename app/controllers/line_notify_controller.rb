class LineNotifyController < ApplicationController
  include LineNotifyHelper
  protect_from_forgery :only => ["authorize"]
  def authorize
    #ログイン時に認証
    if logged_in?
      line_notify_authorize
    end
  end
  def token
    #パラメータにcodeが存在すれば実行
    if params[:code]
      token = line_notify_get_token params[:code]
      @user = current_user
      @user.notifytoken = token
      @user.save
    end
   line_notify_send_message(@user.notifytoken,"この通知は確認用です")
   flash[:success] = "LINEの登録が完了しました!"
   redirect_to root_url
  end
  def sending

    access_counter #アクセスカウンタ
    #パラメータよりメッセージの作成:param一覧[comunity,member,recipe,place,date]
    profiles = Profile.where(user_id: (params[:usersId].map(&:to_i)))
    message = "レシコミからです!!"+"\nコミュニティ名:"+params[:comunity]+"\n集合場所:"+params[:placeName]+"\n集合日時:"+params[:date]
    message << "メンバー\n"

    profiles.each do |p|
        message << "#{p.user.name} (#{p.sex})\n"
    end
              #+"\nレシピ"+ params[:recipe]
              #+"\nメンバー"+users.name
    profiles.each do |p|
      line_notify_send_message(p.user.notifytoken,message)
    end
    redirect_to root_url
  end

  private

  def access_counter
     CommunityCounter.increment_counter(:counter,1)
     counters = CommunityCounter.find(1)
     @counter =  counters.counter
  end

end
