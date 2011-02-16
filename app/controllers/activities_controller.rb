class ActivitiesController < ApplicationController
  def index
    @activities = Activity.hot(current_city)
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def map
    render :layout => 'map_layout'
  end
end
