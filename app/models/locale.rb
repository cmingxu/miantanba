class Locale < ActiveRecord::Base
  def self.get(code)
    self.where(:code => code).first
  end
end



class Area < Locale
  has_many :streets, :foreign_key=>"parent_id"
  belongs_to :city, :foreign_key=>"parent_id"
end

class Street < Locale
  belongs_to :area, :foreign_key=>"parent_id"
end
