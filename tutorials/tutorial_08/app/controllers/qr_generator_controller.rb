require "rqrcode"

class QrGeneratorController < ApplicationController
  def handle_upload
    if (params[:image])
      uploaded_image = params[:image]
      @filename = uploaded_image.original_filename.split(".")[0]
      File.open(Rails.root.join("public", uploaded_image.original_filename), "wb") do |file|
        file.write(uploaded_image.read)
      end
      qrcode = RQRCode::QRCode.new("http://localhost:3000/#{uploaded_image.original_filename}")
      png = qrcode.as_png(
        bit_depth: 1,
        border_modules: 4,
        color_mode: ChunkyPNG::COLOR_GRAYSCALE,
        color: "black",
        file: nil,
        fill: "white",
        module_px_size: 6,
        resize_exactly_to: false,
        resize_gte_to: false,
        size: 120,
      )
      IO.binwrite(Rails.root.join("public", "#{@filename}-qrcode.png"), png.to_s)
      session[:file] = "#{@filename}-qrcode.png"
      render :show
    else
      @error = "Image can't be blank!"
      render :index
    end
  end

  def handle_download
    send_file(Rails.root.join("public", session[:file]), type: "images/png")
  end
end
