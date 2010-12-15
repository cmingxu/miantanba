class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :activity_id
      t.text :content
      t.integer :comment_type
      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
