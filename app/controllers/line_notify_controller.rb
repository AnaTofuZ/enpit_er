class LineNotifyController < ApplicationController
  include LineNotifyHelper
  def authorize
    #認証,トークン取得,通知はここから
    if(params[:code].empty? && params[:state].empty?)
      line_notify_authorize
    elsif(params[:state] == "aaa")
      line_notify_get_token params[:code]
    end
  end
end
