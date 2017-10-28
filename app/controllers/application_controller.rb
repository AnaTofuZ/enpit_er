class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  def hello
    render html: "hello, world!and hogehoge"
  end

  private

  def logged_in_user
      unless logged_in?
      flash[:notice] = "ログインしてくれ!"
      redirect_to login_url
      end
  end
end
