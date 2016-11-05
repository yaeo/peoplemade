class Story < ApplicationRecord
  #association
  belongs_to  :user
  has_many    :topics

  accepts_nested_attributes_for :topics

  enum status: { draft: 0, inreview: 1, published: 2, deleted: 4}

  def company_name
    self.user.company.name
  end

  def company_logo
    self.user.company.logo
  end
end
