class CreateCategories < ActiveRecord::Migration
  def self.up
    create_table :categories do |t|
      t.string :name
      t.string :code
      t.integer :parent_id
      t.boolean :is_hot
      t.integer :hot_level, :default => 0
    end
  end

  def self.down
     drop_table :categories
  end
end
