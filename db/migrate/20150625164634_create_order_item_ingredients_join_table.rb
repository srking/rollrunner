class CreateOrderItemIngredientsJoinTable < ActiveRecord::Migration
  def change
    create_join_table :order_items, :ingredients do |t|
      # t.index [:order_item_id, :ingredient_id]
      # t.index [:ingredient_id, :order_item_id]
    end
  end
end
