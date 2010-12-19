namespace :export do
  task :categories => :environment do
    builder = Nokogiri::XML::Builder.new do |doc|
      doc.categories do
        a = Category.where(:parent_id => nil).all.collect do |top|
          doc.category do
            doc.name top.name
            puts doc.name
            doc.children do
              top.children.each do |c|
                doc.name c.name
                puts c.name
              end
            end
#          [top.name, top.children.collect { |c| c.name }]
          end
        end
      end
    end

    puts builder.to_xml
    f = File.open(Rails.root.join("db", "categories.xml"), "w")
    f << builder.to_xml
    f.close
  end
end