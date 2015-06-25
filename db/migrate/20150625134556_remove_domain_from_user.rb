class RemoveDomainFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :domain, :string
  end
end
