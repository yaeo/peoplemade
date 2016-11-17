class Image < ApplicationRecord
  #association
  belongs_to :product

  mount_uploader :image, ImageUploader
end
