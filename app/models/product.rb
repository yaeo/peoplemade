class Product < ApplicationRecord
  #association
  belongs_to  :company
  has_many    :images
  has_many    :stories_products
  has_many    :stories, through: :stories_products
  accepts_nested_attributes_for :images
end
