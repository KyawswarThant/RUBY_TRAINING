class UploadImageController < ApplicationController
  def handle_upload
    uploaded_image = params[:image]
    folder_name = params[:folder]
    destination = "public/"+folder_name
    @url = "#{folder_name}/#{uploaded_image.original_filename}"
    unless(Dir.exists?(destination)) # Check foler name exists in project_root/public/ dir
      Dir.mkdir(destination) # If the folder doesn't already exists create under root/public/ dir

      File.open(Rails.root.join(destination, uploaded_image.original_filename), "wb") do |file|
        file.write(uploaded_image.read)
      end
    else
      File.open(Rails.root.join(destination, uploaded_image.original_filename), "wb") do |file|
        file.write(uploaded_image.read)
      end
    end
  end
end
