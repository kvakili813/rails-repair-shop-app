class Job < ApplicationRecord
  belongs_to :customer
  belongs_to :repairman
  has_many :tickets, dependent: :destroy
end
