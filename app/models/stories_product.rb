class StoriesProduct < ApplicationRecord
  #association
  belongs_to  :product
  belongs_to  :story
end
