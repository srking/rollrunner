class Roll < ActiveRecord::Base
  belongs_to :order
  belongs_to :owner, class_name: User, foreign_key: :user_id
  has_many :roll_ingredients
  has_many :ingredients, through: :roll_ingredients, dependent: :destroy

  validates :ingredients, presence: true
end
