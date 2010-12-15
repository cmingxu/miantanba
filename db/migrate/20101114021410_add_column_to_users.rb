class AddColumnToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :active_code,:string
    add_column :users, :is_actived,:integer
  end

  def self.down
    remove_column(:users,:active_code,:is_actived)
  end
end
