class City < Locale
  has_many :areas, :foreign_key=>"parent_id"
end