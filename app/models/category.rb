class Category < ActiveRecord::Base
  def self.root_categories
    where(:parent_id => nil)
  end

  has_many :children, :foreign_key => 'parent_id', :class_name => 'Category'
  belongs_to :parent, :foreign_key => 'parent_id', :class_name => 'Category'
  
#  scope :sup,:conditions => ["parent_id is null"],:order => "id asc"
#  # 所有子类业务分类信息
#  scope :sub,:conditions => ["parent_id is not null"],:order => "id asc"
#
#  has_many :sub_categories,:class_name => "Category", :foreign_key => "parent_id"
#  belongs_to :sup_category,:class_name => "Category", :foreign_key => "parent_id"
#
#  has_many :children, :class_name => "Category", :foreign_key => "parent_id"

#  def to_xml(options = {})
#    options[:indent] ||= 2
#    builder = options[:builder] || Builder::XmlMarkup.new(:indent => options[:indent])
#    builder.category do
#      builder.code self.code
#      builder.name self.name
#    end
#  end
end
