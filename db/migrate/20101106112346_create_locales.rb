class CreateLocales < ActiveRecord::Migration
  def self.up
    create_table :locales do |t|
      t.string :name
      t.integer :parent_id
      t.timestamps
    end
  end

  def self.down
    drop_table :locale
  end
end
