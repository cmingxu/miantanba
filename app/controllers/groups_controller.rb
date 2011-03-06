class GroupsController < ApplicationController

	def index
		
	end
	
	def new
		@group = Group.new
	end

	def show
		@group = Group.find_by_id(params[:id])
	end
	
	def create 
		@group = Group.new(params[:group])
		@group.owner_id = current_user.id
		if @group.save
			redirect_to :action => :show, :id => @group.id
		else
			render :action => :new
		end
	end
	

end
