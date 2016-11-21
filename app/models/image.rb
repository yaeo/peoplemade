class Image < ApplicationRecord
  #association
  belongs_to :product

  #carrierwave
  mount_uploader :image, ImageUploader

  #validation
  validates :image, presence: true
end
