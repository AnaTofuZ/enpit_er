module LineNotifyHelper
  require 'net/https'
  require 'json'
  @redirect_uri=''.freeze
  @id = 'AE3ab3vVKQtglAtqfNOrqq'.freeze
  @secret = 'Y82tINHu6dGdmejvZdtBfEkP2COzwbMSOI4BIHUCvaL'
  #登録認証
  def line_notify_authorize()
    @auth_url = "https://notify-bot.line.me/oauth/authorize?"
    sss = {  'response_type' => 'code',
	            'client_id' => 'AE3ab3vVKQtglAtqfNOrqq',
	            'redirect_uri'=> @redirect_uri,
	            'scope' => 'notify',
	            'state' => 'aaa',
	            'response_mode' => 'form_post'
      }
    #リダイレクト
    redirect_to @auth_url + sss.map{|k,v| URI.encode(k.to_s) + "=" + URI.encode(v.to_s)}.join("&")
  end
  #トークン取得
  def line_notify_get_token(code)
    @get_url = UIR.parse("https://notify-bot.line.me/oauth/token")
    http = Net::HTTP.new(@get_url.host, @get_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(@get_url.path)
    req.set_form_data({
            "grant_type" => "authorization_code",
            "code" => code,
            "redirect_uri" => @redirect_uri,
            "client_id" => @id,
            "client_secret" => @secret
          })
    res = http.request(req)
    result = JSON.parse(res)
    session[:access_token]=result['access_token']
  end
  #トークン期限確認
  def line_notify_token_status?
    @status_url = "https://notify-api.line.me/api/status"
  end
  #通知
  # def line_notify_send_message
  #   @token_url = UIR.parse("https://notify-api.line.me/api/notify")
  #   http = Net::HTTP.new(@get_url.host, @get_url.port)
  #   http.use_ssl = true
  #   http.verify_mode = OpenSSL::SSL::VERIFY_NONE
  #   req = Net::HTTP::Post.new(@get_url.path)
  #   req["Authorization"] = "Bearer " + session[]
  #   メッセージ及び画像ごとに形式の変換（配列形式で送る場合の条件分岐を行えるようにする）
  #   req.body = payload#別案（配列を入れる）
  #   req.set_form_data({
  #           "grant_type" => "authorization_code",
  #           "code" => code,
  #           "redirect_uri" => @redirect_uri,
  #           "client_id" => @id,
  #           "client_secret" => $secret
  #         })
  #   res = http.request(req)
  #   result = JSON.parse(res)

  # end
  
end
