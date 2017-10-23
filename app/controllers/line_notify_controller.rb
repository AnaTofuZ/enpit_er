class LineNotifyController < ApplicationController
  include LineNotifyHelper
  protect_from_forgery :only => ["authorize"]
  def authorize
    #認証,トークン取得,通知はここから
    if !params[:code]
      line_notify_authorize
    elsif params[:state] == "aaa"
      line_notify_get_token params[:code]
    end
  end
  # get '/authorize', to:'line_notify#authorize'
  # post '/authorize', to:'line_notify#authorize'
end
