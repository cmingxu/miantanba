class Page < ActiveRecord::Base

  validate :content,:presence => true

  def to_param
    self.slug
  end
end
