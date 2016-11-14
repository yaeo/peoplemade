class Product < ApplicationRecord
  #association
  belongs_to  :company
  has_many    :images

  accepts_nested_attributes_for :images
end
