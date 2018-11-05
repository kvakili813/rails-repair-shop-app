class Ticket < ApplicationRecord
  belongs_to :job
  validates :description, presence: true
  validates :price, presence: true

  scope :finished, -> { where(status: 1) }
  scope :price_order, -> {order("tickets.price DESC") }

  enum status: [:pending, :completed]
end
