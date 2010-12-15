class UsersController < ApplicationController
  def index
    if params[:category_id]
      @sup_category=Category.find params[:category_id]
    else
      @sup_category=Category.sup.first
    end
    @sub_categories=@sup_category.sub_categories
    if params[:sub_category_id]
      @sub_category_id=params[:sub_category_id]
    else
      @sub_category_id=@sub_categories.first.id
    end
    if(session[:city_id])
      @city=City.find(session[:city_id])
    else
      @city=City.first
    end
    @areas=@city.areas
  end
  
  def signup
    @cities=City.all
    @areas=Area.find_all_by_parent_id @cities.first.id
    @streets=Street.find_all_by_parent_id @areas.first.id
    render :layout=>"login"
  end

  def create
    @user=User.new(params[:user])
    @user.level=0
    @user.mianzi=0
    @user.is_actived=User::ACTIVED
    if @user.save
      session[:user_id]=@user.id
      session[:display_name]=@user.display_name
      redirect_to :action=>:index
    else
      @cities=City.all
      @areas=Area.find_all_by_parent_id @cities.first.id
      @streets=Street.find_all_by_parent_id @areas.first.id
      render :action =>:signup,:layout=>"login"
    end
  end

  def change_area
    @areas=Area.find_all_by_parent_id params[:parent_id]
    @streets=Street.find_all_by_parent_id @areas.first.id
    render :update do |page|
      page.replace_html "area",options_for_select(@areas.collect{|area| [area.name,area.id]})
      page.replace_html "street",options_for_select(@streets.collect{|street| [street.name,street.id]})
    end
  end

  def change_street
    @streets=Street.find_all_by_parent_id params[:parent_id]
    render :update do |page|
      page.replace_html "street",options_for_select(@streets.collect{|street| [street.name,street.id]})
    end
  end
  
end
