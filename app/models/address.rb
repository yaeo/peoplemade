class Address < ApplicationRecord
  #association
  belongs_to :user

  #validation
  validates :zipcode1, presence: true
  validates :zipcode2, presence: true
  validates :prefecture, presence: true
  validates :address1, presence: true
end
