class CreateGroups < ActiveRecord::Migration
  def self.up
    create_table :groups do |t|
      t.integer :owner_id
      t.string :name
      t.text    :description


      t.string :contact
      t.string :phone
      t.integer :level
      t.string :real_name
      t.text :purpose
      t.integer :authorize
      t.string :shorter
      t.integer :industry_id
      t.timestamps
    end
  end

  def self.down
    drop_table :groups
  end
end
