class Company < ApplicationRecord
  #validation
  validates :custom_url, presence: true
  validates :name, presence: true
  validates :kana, presence: true
  validates :logo, presence: true
  validates :custom_url, format: { with: /\A[a-z0-9-]+\z/,
                                   message: "小文字の英数字とハイフンで設定してください" }

  #association
  belongs_to  :user
  has_many    :products

  mount_uploader :logo, ImageUploader
  mount_uploader :cover_image, ImageUploader
end
