class SessionsController < ApplicationController
	def user_login
		@user = User.find_by(username: user_params[:username])
		if @user && @user.authenticate(user_params[:password])
			token = JWT.encode({user_id: @user.id}, ENV['SECRET_KEY'])
			render json: { token: token }
		else
			render json: {
				error: "Wrong username and/or password"
			}, status: :unauthorized
		end
	end

	def user_persist
		token = request.headers["Authorization"]
		begin
			payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		rescue JWT::DecodeError
			nil
		end
		if (payload)
			id = payload[0]["user_id"]
			@user = User.find(id)
			render json: @user, include: "**"
		else
			render json: { error: "Invalid token" }
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
