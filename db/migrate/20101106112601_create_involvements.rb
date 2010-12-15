class CreateInvolvements < ActiveRecord::Migration
  def self.up
    create_table :involvements do |t|
      t.integer :user_id
      t.integer :activity_id
      t.timestamps
    end
  end

  def self.down
    drop_table :involvements
  end
end
