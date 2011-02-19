class HomeController < ApplicationController
  def index
    @city = current_city
    redirect_to city_home_path(@city.code)
  end
end