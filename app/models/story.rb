class Story < ApplicationRecord
  #validation
  validates :title,   presence: true
  validates :intro,   presence: true
  validates :content, presence: true
  validates :status,  presence: true
  validates :image,  presence: true

  #association
  belongs_to  :user
  has_many    :topics
  has_many    :stories_products
  has_many    :products, through: :stories_products
  accepts_nested_attributes_for :topics
  accepts_nested_attributes_for :stories_products

  #enum status
  enum status: { draft: 0, inreview: 1, published: 2, deleted: 3}

  #carrierwave uploader
  mount_uploader :image, ImageUploader

  def company_name
    self.user.company.name
  end

  def company_logo
    self.user.company.logo
  end

  def cover_image
    self.user.company.cover_image
  end

  def custom_url
    self.user.company.custom_url
  end
end
