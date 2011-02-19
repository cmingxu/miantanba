class Category < ActiveRecord::Base
  def self.top_categories
    where(:parent_id => nil)
  end
#  scope :sup,:conditions => ["parent_id is null"],:order => "id asc"
#  # 所有子类业务分类信息
#  scope :sub,:conditions => ["parent_id is not null"],:order => "id asc"
#
#  has_many :sub_categories,:class_name => "Category", :foreign_key => "parent_id"
#  belongs_to :sup_category,:class_name => "Category", :foreign_key => "parent_id"
#
#  has_many :children, :class_name => "Category", :foreign_key => "parent_id"
end
