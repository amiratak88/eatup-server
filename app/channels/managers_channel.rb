class ManagersChannel < ApplicationCable::Channel
	def subscribed
		manager = Manager.find(params[:manager])
		stream_for manager
	end

	def unsubscribed
		# Any cleanup needed when channel is unsubscribed
	end
end