module Crawler
  module Parsers
    class Ganji < Parser
      def run
        site = Site.find_by_code('ganji')
        city = City.find_by_short_code('bj')
        root_category = Category.find_by_code(:jiaoyou)
        category = Category.find_by_code(:lvyoujianshen)
        city_url = "#{city.short_code}.ganji.com"
        index_url = "#{city_url}/huodong1"
        begin
          crawl_channel(index_url, city_url, site, city, root_category, category)
        rescue Exception => e
          puts 'error occurs'
          puts e.message
          puts e.backtrace
        end
      end

      def crawl_channel(index_url, city_url, site, city, root_category, category)
        doc = Crawler::Tool.fetch(index_url)

        doc.search('.list_noimg').each do |item|
          attrs = {
              :title => item.search('.list_title').text,
              :weblink => "http://" + city_url + item.search('.list_title').attr('href').text,
              :start_time => Time.zone.parse(item.search('dd').first.text),
              :end_time => Time.zone.parse(item.search('dd')[1].text),
              :address_desc => item.search('.list_word_event').text.gsub("地点:", "")
          }

          a = Activity.find_by_weblink(attrs[:weblink])
          if !a
            a = Activity.create(attrs.merge(:site_id => site.id,
                                            :site_code => site.code,
                                            :city_id => city.id,
                                            :root_category_id => (root_category ? root_category.id : nil),
                                            :category_id => (category ? category.id : nil)
                                ))
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
          update_activity(a.weblink, a)
        end
      end

      def update_activity(url, activity)
        data = {}
        doc = Crawler::Tool.fetch(url)
        description = doc.search('.detailInfo > span').first.inner_html
        data[:description] = description
        doc.search('.detal_left dt').each { |dt|
          if dt.text == "区域:"
            region = dt.parent.search('dd').first.text
            r = region.split("-").collect { |it| it.strip }
            if r
              area = Locale.where(:parent_id => activity.city_id, :name => r.first).first
              if area
                data[:area_id] = area.id
              end
            end
          end
        }
        activity.update_attributes(data)
      end

      def index_pages
        channel_pages = [["huodong1", :jiaoyou, :lvyoujianshen],
                         ["huodong2", :gongyi, :zhiyuanhuodong],
                         ["huodong3", :huizhan, :zhanlanzhanshi],
                         ["huodong4", :jiaoyou, :xingqujiaoyou],
                         ["huodong7", :jiaoyou, :lvyoujianshen],
                         ["zhaopinhui", :huizhan, :rencaizhaopin],
                         ["jiaoyou4", :jiaoyou, :hunlianqueqiao],
                         ["jiaoyou5", :jiaoyou, :hunlianqueqiao],
                         ["jiaoyou6", :jiaoyou, :hunlianqueqiao],
                         ["jiaoyou7", :jiaoyou, :hunlianqueqiao]
        ]
      end

      def loop
        City.opened.each do |city|
          yield
        end
      end
    end
  end
end
