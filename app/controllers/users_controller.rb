class UsersController < ApplicationController

	def show
		@user = User.first
		render :json => @user, :include => {:favorited_restaurants => {:only => :name}}, :except => [:created_at, :updated_at]
	end

end
