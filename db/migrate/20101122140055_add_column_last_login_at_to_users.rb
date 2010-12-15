class AddColumnLastLoginAtToUsers < ActiveRecord::Migration
  def self.up
    add_column :users,:last_login_at,:timestamp
  end

  def self.down
    remove_column(:users, :last_login_at)
  end
end
