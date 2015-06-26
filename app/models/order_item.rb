class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :user
  has_and_belongs_to_many :ingredients
  accepts_nested_attributes_for :ingredients
end
