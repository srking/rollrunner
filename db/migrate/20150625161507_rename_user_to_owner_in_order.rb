class RenameUserToOwnerInOrder < ActiveRecord::Migration
  def change
      rename_column :orders, :user_id, :owner_id
  end
end
