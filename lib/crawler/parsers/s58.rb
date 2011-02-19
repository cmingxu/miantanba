module Crawler
  module Parsers
    class S58 < Parser
      def run
        crawl_channel
      end

      def crawl_channel
        site_root = "bj.58.com"
        url = "bj.58.com/huodong"
        doc = Crawler::Tool.fetch(url)
        site = Site.find_by_code('58')
        city = City.find_by_code('beijing')
        
        doc.search('#infolist tr td:nth-child(2)' ).each do |item|
          attrs = {
              :title => item.search('a').first.text,
              :weblink => item.search('a').first.attr('href'),
              :start_time => Time.zone.parse(item.search('.slash').first.previous_sibling.content.gsub("活动时间：", '')),
              :address_desc => item.search('.slash').first.next_sibling.content.gsub("场地：", "")
          }

          a = Activity.find_by_weblink(attrs[:weblink])
          if !a
            a = Activity.create(attrs.merge(:site_id => site.id,
                                            :site_code => site.code,
                                            :city_id => city.id))
          else
            if a.title == attrs[:title] &&
                a.start_time == attrs[:start_time] &&
                a.address_desc == attrs[:address_desc]
              break
            else
              a.update_attributes(attrs)
            end
          end
          update_activity(a.weblink, a)
        end
      end

      def update_activity(url, activity)
        doc = Crawler::Tool.fetch(url)
        description = doc.search('.content > .conleft').first.inner_html
        activity.update_attributes(:description => description)
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
