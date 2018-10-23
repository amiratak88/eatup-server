class AddressSerializer < ActiveModel::Serializer
	attributes :id, :line1, :line2, :city, :state, :zipcode, :country
end
