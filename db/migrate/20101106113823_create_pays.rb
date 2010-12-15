class CreatePays < ActiveRecord::Migration
  def self.up
    create_table :pays do |t|
      t.integer :user_id
      t.integer :amount
      t.string :type
      t.timestamps
    end
  end

  def self.down
    drop_table :pays
  end
end
