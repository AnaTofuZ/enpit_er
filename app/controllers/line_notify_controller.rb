class LineNotifyController < ApplicationController
  include LineNotifyHelper
  protect_from_forgery :only => ["authorize"]
  def authorize
    #認証,トークン取得が行える
    line_notify_authorize
  end
  def token
    if params[:code]
      token = line_notify_get_token params[:code]
      @user = current_user
      @user.notifytoken = token
      @user.save
    end
  end
end