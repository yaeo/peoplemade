class Product < ApplicationRecord
  #association
  belongs_to  :company
  has_many    :images, dependent: :destroy
  has_many    :stories_products, dependent: :destroy
  has_many    :stories, through: :stories_products
  accepts_nested_attributes_for :images

  #validation
  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validate  :has_images?

  def has_images?
    if self.images.first.image.blank?
      errors.add(:images, "should have least one image")
    end
  end
end
