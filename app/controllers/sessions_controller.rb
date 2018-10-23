class SessionsController < ApplicationController
	def user_login
		@user = User.find_by(username: user_params[:username])
		if @user && @user.authenticate(user_params[:password])
			render json: @user, include: "**"
		else
			render json: {
				error: "Wrong username and/or password"
			}, status: :unauthorized
		end
	end

	def manager_login
		@manager = manager.find_by(username: manager_params[:username])
		if @manager && @manager.authenticate(manager_params[:password])
			render json: @manager
		else
			render json: {
				error: "Wrong username and/or password"
			}, status: :unauthorized
		end
	end

	def user_persist
	end

	def manager_persist
	end

	private

	def user_params
		params.require(:user).permit(:username, :password)
	end

	def manager_params
		params.require(:manager).permit(:username, :password)
	end
end
