class UsersChannel < ApplicationCable::Channel
	def subscribed
		set_user
		stream_for @user
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end

	def set_user
		token = params[:user]
		payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		@user = User.find(payload[0]["user_id"])
	end
end
