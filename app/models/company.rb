class Company < ApplicationRecord
  #validation
  validates :custom_url, presence: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :logo, presence: true
  
  #association
  belongs_to :user

  mount_uploader :logo, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
