class ActivitiesController < ApplicationController
  def city_home
    @city = City.find_by_code(params[:city])
    current_user.city = @city
    response.cookies[:city] = @city.code
    @activities = Activity.hot(@city).paginate(:page => params[:page])
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def map
    @activities = Activity.hot(current_city)
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
end
