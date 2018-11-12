class ManagersChannel < ApplicationCable::Channel
	def subscribed
		stream_for @manager
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end

	def set_user
		token = params[:manager]
		payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		@manager = manager.find(payload[0]["manager_id"])
	end
end