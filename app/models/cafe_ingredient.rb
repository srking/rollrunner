class CafeIngredient < ActiveRecord::Base
  belongs_to :cafe
  belongs_to :ingredient
end
