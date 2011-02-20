class City < Locale
  has_many :areas, :foreign_key=>"parent_id"

  def self.opened
#    where("short_code in (?)", short_codes)
    [:bj, :tj, :dl,
        :sh, :hz, :nj,
        :gz, :sz, :fs,
        :cd, :xa, :cs
    ].map do |short_code|
      City.find_by_short_code(short_code)
    end.compact
  end
end