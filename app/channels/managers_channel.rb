class ManagersChannel < ApplicationCable::Channel
	def subscribed
		byebug
		stream_for Manager.find(1)
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end
end
