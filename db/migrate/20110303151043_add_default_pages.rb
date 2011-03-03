class AddDefaultPages < ActiveRecord::Migration
  def self.up
    default = %w{ about contacts help privacy term feedbak}
    default.each do |slug|
       Page.find_or_create_by_slug_and_content(slug,slug)
    end
  end

  def self.down
    Page.delete_all
  end
end
