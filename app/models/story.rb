class Story < ApplicationRecord
  #association
  belongs_to  :user
  has_many    :topics

  accepts_nested_attributes_for :topics

  def company_name
    self.user.company.name
  end

  def company_logo
    self.user.company.logo
  end
end
