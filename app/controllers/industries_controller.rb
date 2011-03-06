class IndustriesController < ApplicationController
	def index
		@industries = Industry.children(params[:id])
		respond_to do |format|
			format.json{ render :json => @industries }
		end
	end
end
