class Industry < ActiveRecord::Base
  has_many :groups

  def self.root
    find(:all, :conditions => "parent_id=0")
  end

  def self.children(parent_id)
    if parent_id
      find(:all, :conditions => ["parent_id=?", parent_id])
    else
      find(:all)
    end
  end

  def children
    self.class.find(:all, :conditions => ["parent_id=?", self.id])
  end

  def children_count
    self.class.count(:conditions => ["parent_id=?", self.id])
  end
end
