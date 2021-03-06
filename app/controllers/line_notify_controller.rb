# coding: utf-8
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
   confirm_message = "この通知は確認用です \nコミュニティ名\n集合場所\n集合日時が通知されます"
   example_message = "(これは例です)レシコミからです!!\nコミュニティ名:鍋大好き会\n集合場所:北口駅\n集合日時:19:00"
   line_notify_send_message(@user.notifytoken,confirm_message)
   line_notify_send_message(@user.notifytoken,example_message)
   flash[:success] = "LINEの登録が完了しました!"
   redirect_to root_url
  end
  def sending
    user = current_user

    access_counter #アクセスカウンタ
    #パラメータよりメッセージの作成:param一覧[comunity,member,recipe,place,date]
    profiles = Profile.where(user_id: (params[:usersId].map(&:to_i)))
    message = "レシコミからです!!"+"\nコミュニティ名:"+params[:comunity]+"\n集合場所:"+params[:placeName]+"\n集合日時:"+params[:date]+"\n"
    message << "作成者: #{user.name} (#{show_gender(user.profile.sex)})\n"
    message << "メンバー\n"
    #洗濯したメンバー
    profiles.each do |p|
        message << "#{p.user.name} (#{show_gender(p.sex)})\n"
    end
    message << "レシコミ\n"
    message << 'https://rececomi.herokuapp.com/'
    message << "\n"
              #+"\nレシピ"+ params[:recipe]
    profiles.each do |p|
      line_notify_send_message(p.user.notifytoken,message)
    end
    #自身への送信
    line_notify_send_message(user.notifytoken,message)
    redirect_to root_url
  end

  private

  def access_counter
     CommunityCounter.increment_counter(:counter,1)
     counters = CommunityCounter.find(1)
     @counter =  counters.counter
  end

  def show_gender(sex)
         if sex == "male" then
             "男性"
         elsif sex == "female" then
             "女性"
         else
             "その他"
         end
  end

  def getPlaceUrl(name)
       if name ==  "琉大工学部" then
            'https://rececomi.herokuapp.com/community/map/1'
		 elsif name == "北口ローソン" then
            'https://rececomi.herokuapp.com/community/map/2'
		 elsif name == "キリ学" then
            'https://rececomi.herokuapp.com/community/map/3'
		 else
				"Error"
      end
  end
end
