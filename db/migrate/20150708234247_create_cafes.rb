class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|
      t.string :name
      t.decimal :doubler_price, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
