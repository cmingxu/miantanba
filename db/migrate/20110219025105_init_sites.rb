class InitSites < ActiveRecord::Migration
  def self.up
    Site.create(:name => '赶集网', :code => 'ganji', :url => 'www.ganji.com')
    Site.create(:name => '58同城网', :code => '58', :url => 'www.58.com')
  end

  def self.down
    Site.destroy_all
  end
end
