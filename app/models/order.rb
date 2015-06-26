class Order < ActiveRecord::Base
  belongs_to :domain
  belongs_to :owner, class_name: User
  has_many :order_items
  has_many :orderers, through: :order_items, class_name: User
  accepts_nested_attributes_for :order_items
end
