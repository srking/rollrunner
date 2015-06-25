class AddDomainToUser < ActiveRecord::Migration
  def change
    add_reference :users, :domain, index: true, foreign_key: true
  end
end
