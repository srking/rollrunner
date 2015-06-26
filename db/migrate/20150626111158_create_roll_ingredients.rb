class CreateRollIngredients < ActiveRecord::Migration
  def change
    create_table :roll_ingredients do |t|
      t.references :roll, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.boolean :include, default: false

      t.timestamps null: false
    end
  end
end
