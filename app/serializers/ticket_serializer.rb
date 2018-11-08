class TicketSerializer < ActiveModel::Serializer
  attributes :id, :description, :price, :status
end
