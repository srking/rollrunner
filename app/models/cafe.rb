class Cafe < ActiveRecord::Base
		has_many :ingredients, through: :cafe_ingredients, dependent: :destroy
		has_many :cafe_ingredients
end
