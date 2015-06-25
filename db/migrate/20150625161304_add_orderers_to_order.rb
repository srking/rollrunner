class AddOrderersToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :order, :string
    add_column :orders, :orderers_id, :integer
  end
end
