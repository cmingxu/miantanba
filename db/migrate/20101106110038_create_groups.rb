class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :user_id
      t.integer :authorize
      t.string :contactor
      t.string :phone
      t.integer :level
      t.string :real_name
      t.string :virtual_name
      t.text :purpose
      t.string :shorter
      t.integer :industry_id
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
