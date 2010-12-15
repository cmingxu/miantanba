# 持久化，实现Cookie的持久化
class CreatePersistentLogins < ActiveRecord::Migration
  def self.up
    create_table :persistent_logins do |t|
      t.column :uid, :string, :null => false
      t.column :user_id, :integer, :null => false
      t.timestamp
    end
  end

  def self.down
    drop_table :persistent_logins
  end
end