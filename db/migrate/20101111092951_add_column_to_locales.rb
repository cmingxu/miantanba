class AddColumnToLocales < ActiveRecord::Migration
  def self.up
    add_column :locales,:type,:string
  end

  def self.down
    remove_column(:locales,:type)
  end
end
