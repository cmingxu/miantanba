class InitSites < ActiveRecord::Migration
  def self.up
    Site.create(:name => '赶集网', :code => 'ganji', :url => 'www.ganji.com')
  end

  def self.down
    Site.destroy_all
  end
end
