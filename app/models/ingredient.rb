class Ingredient < ActiveRecord::Base
	has_many :roll_ingredients
	has_many :rolls, through: :roll_ingredients
	has_many :cafes, through: :cafe_ingredients, dependent: :destory
	has_many :cafe_ingredients
end
