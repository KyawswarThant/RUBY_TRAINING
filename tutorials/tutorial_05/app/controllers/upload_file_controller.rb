class UploadFileController < ApplicationController
  def handle_upload
    uploaded_file = params[:upload_file]
    if uploaded_file == nil
      redirect_to "/"
    else
      @content = uploaded_file.read
    end
  end
end
