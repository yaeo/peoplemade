class Image < ApplicationRecord
  #association
  belongs_to :product

  #carrierwave
  mount_uploader :image, ImageUploader
end
