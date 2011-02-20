#require '/home/sliu/scala/lib/scala-library.jar'
#require '/home/sliu/tuan/crawler/crawler.jar'
#
#Crawler = com.enjoymyday.tuan.crawler
#Parsers = Crawler::parsers

namespace :crawler do
  task :run => :environment do |t, args|
#    puts args[:site]
#    site = Site.site(args[:site])

#    if !site
#      raise "No Corresponding Site!!! ^#{args[:site]}^"
#    end

#    site.effect
#    Crawler::Tool.crawl(args[:site])
    puts 'crawl ganji.com...'
    c = Crawler::Parsers::Ganji.new
    c.run

    puts 'crawl 58.com...'
    c = Crawler::Parsers::S58.new
    c.run    
  end
#
#  task :all => :environment do
#    Site.refresh
#
#    #Deal.destroy_all
#
#    Site.all.each do |site|
#      Crawler::Tool.crawl(site.code)
#    end
#  end
end

