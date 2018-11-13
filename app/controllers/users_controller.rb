class UsersController < ApplicationController

	def index
		render json: User.all
	end

	def show
		@user = User.find(params[:id])
		render :json => @user, include: "**", scope: "user"
	end

end
