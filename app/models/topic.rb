class Topic < ApplicationRecord
  #association
  belongs_to :story

  mount_uploader :image, ImageUploader
end
