#require '/home/sliu/scala/lib/scala-library.jar'
#require '/home/sliu/tuan/crawler/crawler.jar'
#
#Crawler = com.enjoymyday.tuan.crawler
#Parsers = Crawler::parsers

namespace :crawler do
  task :update, [:site] => :environment do |t, args|
    puts args[:site]

#    if Site.site(args[:site]).blank?
#      Rake::Task["init:all:refresh"].invoke
#    end

    site = Site.site(args[:site])
    if site
      site.destroy
    end

    Site.refresh

    site = Site.site(args[:site])

    if !site
      raise "No Corresponding Site!!! ^#{args[:site]}^"
    end

#    site.effect
    Crawler::Tool.crawl(args[:site])
  end

  task :all => :environment do
    Site.refresh

    #Deal.destroy_all

    Site.all.each do |site|
      Crawler::Tool.crawl(site.code)
    end
  end
end

namespace :cities do
  task :clear => :environment do
    City.clear
  end

  task :refresh => :environment do
    City.refresh
  end
end

namespace :sites do
  task :clear => :environment do
    Site.clear
  end

  task :refresh => :environment do
    Site.refresh
  end
end

namespace :categories do
  task :clear => :environment do
    Category.clear
  end

  task :refresh => :environment do
    Category.refresh
  end
end

namespace :init do
  namespace :all do
    task :clear => :environment do
      Category.clear
      Site.clear
      City.clear
    end

    task :refresh => :environment do
      Category.refresh
      Site.refresh
      City.refresh
    end
  end

end