class Locale < ActiveRecord::Base
  
end

class City<Locale
  has_many :areas,:foreign_key=>"parent_id"
end

class Area<Locale
  has_many :streets,:foreign_key=>"parent_id"
  belongs_to :city,:foreign_key=>"parent_id"
end

class Street<Locale
  belongs_to :area,:foreign_key=>"parent_id"
end
