class Story < ApplicationRecord
  #association
  belongs_to  :user
  has_many    :topics

  accepts_nested_attributes_for :topics

  def company_name
    self.user.company.name
  end
end
