class Story < ApplicationRecord
  #validation
  validates :title,   presence: true
  validates :intro,   presence: true
  validates :content, presence: true
  validates :status,  presence: true

  #association
  belongs_to  :user
  has_many    :topics
  accepts_nested_attributes_for :topics

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

  # def image
  #   self.topics[0].image
  # end
end
