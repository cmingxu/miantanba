module Crawler
  module Parsers
    class Parser
      attr_accessor :site, :url, :template

      def initialize(site, url, template_name)
        @site = site
        @url = url
        @template_name = template_name
      end

      def fetch
        Crawler::Tool.fetch(@url)
      end

      # abstract
      def parse(node)
        raise "not implemented!!!"
      end

      def update(deals)
        Crawler::Tool.update(deals)
      end

      def work
        begin
          doc = fetch
          deals = parse(doc)
          update(deals)
        rescue RestClient::NotModified => e
          puts 'Not-Modified'
        rescue Exception => e
          puts e.message
          puts e.backtrace
        end
      end


    end
  end
end