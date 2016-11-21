class Product < ApplicationRecord
  #association
  belongs_to  :company
  has_many    :images, dependent: :destroy
  has_many    :stories_products, dependent: :destroy
  has_many    :stories, through: :stories_products
  accepts_nested_attributes_for :images
end
