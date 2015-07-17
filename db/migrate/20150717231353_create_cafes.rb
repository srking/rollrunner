class CreateCafes < ActiveRecord::Migration
  def change
    create_table :cafes do |t|

      t.timestamps null: false
    end
  end
end
