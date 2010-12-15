class Category < ActiveRecord::Base
  scope :sup,:conditions => ["parent_id is null"],:order => "id asc"
  # 所有子类业务分类信息
  scope :sub,:conditions => ["parent_id is not null"],:order => "id asc"

  has_many :sub_categories,:class_name => "Category", :foreign_key => "parent_id"
  belongs_to :sup_category,:class_name => "Category", :foreign_key => "parent_id"
end
