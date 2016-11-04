class Company < ApplicationRecord
  #association
  belongs_to :user

  mount_uploader :logo, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
