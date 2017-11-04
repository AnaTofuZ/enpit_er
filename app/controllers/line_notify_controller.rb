class LineNotifyController < ApplicationController
  include LineNotifyHelper
  protect_from_forgery :only => ["authorize"]
  def authorize
    #認証,トークン取得が行える
    if !params[:code]
        line_notify_authorize
    elsif params[:state] == "aa" #ハッシュ機能か何かでそいつ自身の暗号を作成しておく 
      token = line_notify_get_token params[:code]
      user=User.find(1)
      user.notifytoken = token
      user.save
    end
  end
end