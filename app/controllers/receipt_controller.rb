class ReceiptController < ApplicationController
  require 'net/https'
  require 'cgi'
  require 'base64'
  def input
  end
  def confrimate
    if params[:fileupload]
      uploaded_file = fileupload_param[:file]
      if Rails.env.development?
        output_path = Rails.root.join('public', uploaded_file.original_filename)
        File.open(output_path, 'w+b') do |fp|
          fp.write  uploaded_file.read
        end
        @img_path = "/"+uploaded_file.original_filename
        @deleteFile = Rails.root.join('public', uploaded_file.original_filename)
      else
        output_path = Rails.root.join('tmp', uploaded_file.original_filename)
        File.open(output_path, 'w+b') do |fp|
          fp.write  uploaded_file.read
        end
        @img_path = "/"+uploaded_file.original_filename
        @deleteFile = Rails.root.join('tmp', uploaded_file.original_filename)
      end    
      result = ocr 
      if result['error']
        @message = result['error']['message']
      elsif result['responses']
        @text = result['responses'][0]['fullTextAnnotation']['text']
        @text = @text.split("\n")
        if !@text.grep(/年/).empty?
          headtext=@text.grep(/2017年/)
          @text.slice!(0..@text.index(headtext[0]))
        end
        if !@text.grep(/合.+/).empty?
          footertext=@text.grep(/合.+/)
          @text.slice!(@text.index(footertext[0])..-1)
        end
      end
      File.delete(@deleteFile)
    elsif params[:text]
      dl = params[:dl]
      @text = params[:text]
      @text.delete(dl)
    end
  end
  
  private
	def fileupload_param
	  params.require(:fileupload).permit(:file)
	end
	def ocr
	  api_key = ENV["VISION_KEY"]
    gurl = "https://vision.googleapis.com/v1/images:annotate?key=#{api_key}"
    get_url = URI.parse(gurl)
    http = Net::HTTP.new(get_url.host, get_url.port)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    req = Net::HTTP::Post.new(get_url)
    body={"requests": [{"image": {"content": Base64.encode64(@deleteFile.read)},"features": [{"type": "TEXT_DETECTION"}]}]}.to_json
    req["Content-Type"] = "application/json"
    res = http.request(req,body)
    result = JSON.parse(res.body)
    logger.debug(result)
	  return result
	end
end
