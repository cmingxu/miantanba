require 'open-uri'
module Crawler
  module Tool
    class << self
      def fetch(url)
#        raise url.inspect
        puts url
#        xml = open(url).read
        xml = RestClient.get(url)
#        xml = File.open(Rails.root.join("crawler_data", "shiketuan.xml"))
#        puts url
#        puts xml
        doc = Nokogiri::XML(xml)

#        puts doc.to_xml
        puts 'fetched'
        doc
      end

      def update(deals)
        created_num = updated_num = 0
        deals.each do |deal|
          ret = update_deal(deal)
          if ret == :created
            created_num += 1
          elsif ret == :updated
            updated_num += 1
          end
        end

        puts "created: #{created_num}, updated: #{updated_num}"
      end
    

      protected
      def update_activity(activity)
#        ret      = nil
#        criteria = Deal.where(:site_id => deal.site_id, :city_id => deal.city_id)
#        if !deal.identifier.blank?
#          criteria = criteria.where(:identifier => deal.identifier)
#        else
#          criteria = criteria.where(:price => deal.price, :value => deal.value, :title => deal.title)
#        end
#
#        local_deal = criteria.first
#        if local_deal
#          if update_deal_if_diff(local_deal, deal)
#            ret = :updated
#          end
#        else
#          if create_deal(deal)
#            ret = :created
#          end
#        end

#        ret
      end

      def update_activity_if_diff(local_deal, deal)
#        different = false
#        %W(title image_url start_time end_time value price
#         bought sold_out tip detail identifier url).each do |field|
#          if local_deal.send(field) != deal.send(field)
#            local_deal.send("#{field}=", deal.send(field))
#            different = true
#          end
#        end
#
#
#        different && local_deal.save
      end

      def create_deal(deal)
#        deal.save
      end

    end
  end
end