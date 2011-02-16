class ActivitiesController < ApplicationController
  def index
    @activities = Activity.hot(current_city)
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
    if @activity.save
      redirect_to "/"
    else
      @categories=Category.all

      render :action=>"new"
    end
  end
end
