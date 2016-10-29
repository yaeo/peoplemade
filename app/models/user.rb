class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #association
  has_one :address
  has_one :company
  has_one :social

  accepts_nested_attributes_for :company
  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :social
end
