class ManagersChannel < ApplicationCable::Channel
	def subscribed
		stream_for Manager.find(params[:manager])
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end
end
