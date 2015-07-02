class Order < ActiveRecord::Base
  belongs_to :domain
  belongs_to :owner, class_name: User
  has_many :rolls, dependent: :destroy

  validates_presence_of :name
end
