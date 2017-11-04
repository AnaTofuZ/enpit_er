class LineNotifyController < ApplicationController
  include LineNotifyHelper
  protect_from_forgery :only => ["authorize"]
  def authorize
    if logged_in?
      #認証,トークン取得が行える
      if !params[:code]
        line_notify_authorize
      elsif params[:state] == "aa" #ハッシュ機能か何かでそいつ自身の暗号を作成しておく 
        line_notify_get_token params[:code]
      end
    end
  end
end