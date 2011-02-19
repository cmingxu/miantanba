module Crawler
  module Parsers
    class Ganji < Parser
      def run
        crawl_channel
      end

      def crawl_channel
        url = "bj.ganji.com/huodong2/"
        doc = Crawler::Tool.fetch(url)
        site = Site.find_by_code('ganji')
        doc.search('.list_noimg').each do |item|
          attrs = {
              :title => item.search('.list_title').text,
              :weblink => item.search('.list_title').attr('href').text,
              :start_time => Time.zone.parse(item.search('dd').first.text),
              :end_time => Time.zone.parse(item.search('dd')[1].text),
              :address_desc => item.search('.list_word_event').text.gsub("地点:", "")
          }

          a = Activity.find_by_weblink(attrs[:weblink])
          if !a
            a = Activity.create(attrs.merge(:site_id => site.id, :site_code => site.code))
          else
            if a.title == attrs[:title] &&
                a.start_time == attrs[:start_time] &&
                a.end_time == attrs[:end_time] &&
                a.address_desc == attrs[:address_desc]
              break
            else
              a.update_attributes(attrs)
            end
          end

        end
      end

      def index_pages
        city_pages = ["bj.ganji.com",
                      "sh.ganji.com",
                      "gz.ganji.com",
                      "sz.ganji.com",
                      "wh.ganji.com",
                      "nj.ganji.com",
                      "tj.ganji.com",
                      "hz.ganji.com"]
        channel_pages = ["huodong1",
                         "huodong2",
                         "huodong3",
                         "huodong4",
                         "huodong5",
                         "huodong6",
                         "huodong7"]

      end
    end
  end
end
