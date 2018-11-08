class JobSerializer < ActiveModel::Serializer
  attributes :id
  has_many :tickets
  has_one :repairman
  has_one :customer
end
