class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :display_name
      t.string :real_name
      t.string :virtual_name
      t.string :password
      t.integer :level
      t.string :email
      t.integer :locale_id
      t.integer :gender
      t.date :birthday
      t.string :company
      t.string :department
      t.string :job
      t.integer :industry_id
      t.text :about_me
      t.integer :mianzi
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
