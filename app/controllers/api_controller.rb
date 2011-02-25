class ApiController < ApplicationController
  API_ROOT = "http://www.enjoymyday.com:3000/api/"

  def activities
    @city = params[:city] && City.find_by_code(params[:city]) || City.find_by_code(:beijing)

    @activities = Activity.where(:city_id => @city.id)
    @activities = @activities.paginate(:page => params[:page], :per_page => params[:per_page] || 20)


    render :xml => activities_xml(@activities)
  end

  def search
    @city = params[:city] && City.find_by_code(params[:city]) || City.find_by_code(:beijing)
#    params[:q]
#    if !params[:lat].blank? && !params[:lng].blank?
#      lat = params[:lat].to_f
#      lng = params[:lng].to_f
#      zoom = params[:zoom].to_i || 2
#    end
#    if !params[:category].blank?
#      categories = params[:category].split(",").select { |it| !it.blank? }
#    end

    @activities = Activity.where(:city_id => @city.id)
    @activities = @activities.paginate(:page => params[:page], :per_page => params[:per_page] || 20)
    render :xml => activities_xml(@activities)
  end

  def activity
    @activity = Activity.find(params[:id])
    render :xml => @activity.to_xml
  end

  def cities
    @cities = City.all
    render :xml => @cities.to_xml
  end

  def categories
#    @categories = Category.all
#    render :xml => @categories.to_xml
    options = {}
    options[:indent] ||= 2
    builder = (options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent]))
    roots = Category.root_categories
    categories_xml = builder.categories do
      roots.each do |category|
        category_xml(category, builder)
      end
    end

    render :xml => categories_xml
  end


  #TODO
  def login

  end

  protected
  def activities_xml(activities)
    options = {}
    options[:indent] ||= 2
    builder = (options[:builder] ||= Builder::XmlMarkup.new(:indent => options[:indent]))
    builder.tag!(:activities, 'total-count' => activities.total_entries) do
      activities.each do |activity|
        activity.to_xml(options)
      end
    end
  end

  def category_xml(category, builder)
    builder.category do
      builder.code category.code
      builder.name category.name
      if !category.children.blank?
        builder.children do
          category.children.each do |sub|
            category_xml(sub, builder)
          end
        end
      end
    end
  end
end