class UploadsController < ApplicationController
  def create
    upload = Upload.new(image: params[:file])
    upload.save!
    render json: { link: upload.image.url }
  end

  def destroy
    Image.find(params[:id]).destroy
  end
end
