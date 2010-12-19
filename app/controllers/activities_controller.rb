class ActivitiesController < ApplicationController
  def index
    @activities = Activity.hot(current_city)
  end
end
