class Ingredient < ActiveRecord::Base
	has_many :roll_ingredients
	has_many :rolls, through: :roll_ingredients
end
