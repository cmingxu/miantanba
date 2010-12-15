class ActivityController < ApplicationController
  def new
    @cities=City.all
    @areas=Area.find_all_by_parent_id @cities.first.id
    @streets=Street.find_all_by_parent_id @areas.first.id
    @sup_categories=Category.sup
    @sub_categories=@sup_categories.first.sub_categories
  end

  def create
    @activity=Activity.new params[:activity]
    @activity.user_id=@current_user.id
    @activity.status=Activity::UPPASS
    if @activity.save
      redirect_to :controller=>"users",:action => "index"
    else
      @cities=City.all
      @areas=Area.find_all_by_parent_id @cities.first.id
      @streets=Street.find_all_by_parent_id @areas.first.id
      @sup_categories=Category.sup
      @sub_categories=@sup_categories.first.sub_categories
      render :action=>"new"
    end
  end

  #ajax变换2级菜单
  def change_category
    @sub_categories=Category.find_all_by_parent_id params[:parent_id]
    render :update do |page|
      page.replace_html "sub",options_for_select(@sub_categories.collect{|sub| [sub.name,sub.id]})
    end
  end
end
