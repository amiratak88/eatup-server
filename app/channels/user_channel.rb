class UserChannel < ApplicationCable::Channel
	def subscribed
		stream_for User.find(1)
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end
end
