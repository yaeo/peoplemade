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
  validates_presence_of :images
end
