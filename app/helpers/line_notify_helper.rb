module LineNotifyHelper
  require 'net/https'
  require 'uri'
  require 'json'
  
  # TODO リダイレクト先の確認(リダイレクト先は後で必ず変更する事)
  $redirect_uri='https://rails-tutorial2-doublequel.c9users.io/authorize'.freeze 

  $id = ENV["LINE_ID"].freeze
  $secret = ENV["LINE_SECRET"].freeze
  #登録認証
  def line_notify_authorize()
    auth_url = "https://notify-bot.line.me/oauth/authorize?"
    sss = {  'response_type' => 'code',
	            'client_id' => 'AE3ab3vVKQtglAtqfNOrqq',
	            'redirect_uri'=> $redirect_uri,
	            'scope' => 'notify',
	            'state' => 'aa',
	            'response_mode' => 'form_post'
      }
    #リダイレクト
    redirect_to auth_url + sss.map{|k,v| URI.encode(k.to_s) + "=" + URI.encode(v.to_s)}.join("&")
  end
  
  #トークン取得
  def line_notify_get_token(code)
    get_url = URI.parse('https://notify-bot.line.me/oauth/token')
    http = Net::HTTP.new(get_url.host, get_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(get_url.path)
    req.set_form_data({
            "grant_type" => "authorization_code",
            "code" => code,
            "redirect_uri" => $redirect_uri,
            "client_id" => $id,
            "client_secret" => $secret
          })
    res = http.request(req)
    result = JSON.parse(res.body)
    session[:access_token]=result['access_token']
  end
  #トークン期限確認
  def line_notify_token_status?
    status_url = "https://notify-api.line.me/api/status"
  end
  #通知(送るユーザー,メッセージ,写真) 送る度に呼び出す形式
  def line_notify_send_message(token,message,imageThumbnail="No img",imageFullsize="No img",imageFile="No img")
    token_url = UIR.parse("https://notify-api.line.me/api/notify")
    http = Net::HTTP.new(token_url.host, token_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(token_url.path)
    req["Authorization"] = "Bearer " + token
    #メッセージ及び画像ごとに形式の変換（配列形式で送る場合の条件分岐を行えるようにする）
    data={
      "message" => message
    }
    if imageThumbnail != "No img"
      data.store("imageThumbnail",imageThumbnail)
    end
    if imageFullsize != "No img"
      data.store("imageFullsize",imageFullsize)
    end
    if imageFile != "No img"
      data.store("imageFile",imageFile)
    end
    req.set_form_data(data)
    res = http.request(req)
    result = JSON.parse(res.body)
    if result['status'] != '200'
      #送れていない事を知らせる(原因も特定のこと)
    end
  end
  
end
