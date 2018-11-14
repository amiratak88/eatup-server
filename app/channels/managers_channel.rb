class ManagersChannel < ApplicationCable::Channel
	def subscribed
		set_manager
		stream_for @manager
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end

	def set_manager
		token = params[:manager]
		payload = JWT.decode(token, ENV['SECRET_KEY'], true)
		@manager = Manager.find(payload[0]["manager_id"])
	end
end