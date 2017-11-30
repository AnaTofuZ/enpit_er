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
   confirm_message = "この通知は確認用です \nレシコミから\nコミュニティ名\n集合場所\n集合日時が通知されます"
   line_notify_send_message(@user.notifytoken,confirm_message)
   flash[:success] = "LINEの登録が完了しました!"
   redirect_to root_url
  end
  def sending

    access_counter #アクセスカウンタ
    #パラメータよりメッセージの作成:param一覧[comunity,member,recipe,place,date]
    users = User.find((params[:usersId].map(&:to_i)))
    message = "レシコミからです!!"+"\nコミュニティ名:"+params[:comunity]+"\n集合場所:"+params[:placeName]+"\n集合日時:"+params[:date]
              #+"\nレシピ"+ params[:recipe]
              #+"\nメンバー"+users.name
    users.each do |m|
      line_notify_send_message(m.notifytoken,message)
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
