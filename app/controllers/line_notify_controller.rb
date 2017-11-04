class LineNotifyController < ApplicationController
  include LineNotifyHelper
  protect_from_forgery :only => ["authorize"]
  def authorize
    #認証,トークン取得が行える
    if !params[:code]
      if logged_in?
        line_notify_authorize
      end
    elsif params[:state] == "aa" #ハッシュ機能か何かでそいつ自身の暗号を作成しておく 
      token = line_notify_get_token params[:code]
      user=User.find(1)
      user.notifytoken = token
      user.save
    end
  end
end