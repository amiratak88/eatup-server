class UsersController < ApplicationController

	# def show
	# 	@user = User.first
	# 	render :json => @user, :include => {:favorited_restaurants => {:only => :name}}, :except => [:created_at, :updated_at]
	# end

	def show
		@user = User.find(params[:id])
		render :json => @user, include: "**"
	end

end
