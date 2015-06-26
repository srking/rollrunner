class RollIngredient < ActiveRecord::Base
  belongs_to :roll
  belongs_to :ingredient
end
