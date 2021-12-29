require "rqrcode"

class QrGeneratorController < ApplicationController
  def handle_upload
    if (params[:text])
      uploaded_text = params[:text]
      qrcode = RQRCode::QRCode.new(uploaded_text)
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
      IO.binwrite(Rails.root.join("public", "qrcode.png"), png.to_s)
      session[:file] = "qrcode.png"

      render :show
    else
      @error = "Image can't be blank!"

      render :index
    end
  end

  def handle_download
    send_file(Rails.root.join("public", session[:file]), type: "application/text")
  end
end
