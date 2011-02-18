class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :login
      t.string :encrypted_password
      t.string :real_name
      t.string :email
      t.integer :city_id
      t.integer :area_id
      t.integer :street_id
      t.string  :address_desc
      t.integer :gender
      t.date :birthday

      t.integer  :status
      t.string   :activate_code

      t.datetime  :last_login_at
      
      t.integer :level
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
