class ReceiptController < ApplicationController
  def input
  end
  def confrimate
    uploaded_file = fileupload_param[:file]
    output_path = Rails.root.join('public', uploaded_file.original_filename)
    
    File.open(output_path, 'w+b') do |fp|
      fp.write  uploaded_file.read
    end
    @img_path = "/"+uploaded_file.original_filename
    @deleteFile = Rails.root.join('public', uploaded_file.original_filename)
  end
  
  private
	def fileupload_param
	  params.require(:fileupload).permit(:file)
	end
end
