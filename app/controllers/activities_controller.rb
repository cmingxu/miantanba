class ActivitiesController < ApplicationController
  def city_home
    
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def map
    find_activities
  end

  # need login
  def new
    @activity = Activity.new

    @categories=Category.all
  end

  def create
    @activity=Activity.new params[:activity]
    @activity.user_id = current_user.id
    @activity.city_id = current_city.id
    if @activity.save
      redirect_to "/"
    else
      @categories=Category.all

      render :action=>"new"
    end
  end

  protected
  def find_activities
    @city = params[:city] && City.find_by_code(params[:city]) || City.find_by_code(:beijing)
    @area = params[:area].blank? ? nil : (@city.areas.where(:code => params[:area]).first || nil)
    @root_category = params[:root_category].blank? ? nil : Category.find_by_code(params[:root_category])

    current_user.city = @city
    response.cookies[:city] = @city.code

    @activities = Activity.where(:city_id => @city.id)
    if @root_category
      @activities = @activities.where(:root_category_id => @root_category.id)
    end
    if @area
      @activities = @activities.where(:area_id => @area.id)
    end
    @activities = @activities.paginate(:page => params[:page])
  end
end
