class CreateGroupUsers < ActiveRecord::Migration
  def self.up
    create_table :group_users do |t|
      t.integer :user_id
      t.integer :group_id
      t.integer :role
      t.timestamps
    end
  end

  def self.down
     drop_table :group_users
  end
end
