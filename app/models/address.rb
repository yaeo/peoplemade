class Address < ApplicationRecord
  #association
  belongs_to :user

  #validation
  validates :zipcode1, presence: true
  validates :zipcode2, presence: true
  validates :prefecture, presence: true
  validates :address1, presence: true

  def full_zipcode
    "#{self.zipcode1} - #{self.zipcode2}"
  end

  def full_address
    "#{self.prefecture}#{self.address1}#{self.address2}"
  end

  def zipcode_address
    "〒#{self.full_zipcode}　#{self.full_address}"
  end
end
