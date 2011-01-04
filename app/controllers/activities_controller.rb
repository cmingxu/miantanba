class ActivitiesController < ApplicationController
  def index
    @activities = Activity.hot(current_city)
  end

  def map
    render :layout => 'map_layout'
  end
end
