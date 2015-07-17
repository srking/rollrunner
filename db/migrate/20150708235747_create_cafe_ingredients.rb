class CreateCafeIngredients < ActiveRecord::Migration
  def change
    create_table :cafe_ingredients do |t|
      t.references :cafe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.decimal :price, precision: 10, scale: 2
      t.decimal :doubler_price, precision: 10, scale: 2
      t.integer :type, null: false, default: 0

      t.timestamps null: false
    end
  end
end
