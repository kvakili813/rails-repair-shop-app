class Ticket < ApplicationRecord
  belongs_to :job
  validates :description, presence: true
  validates :price, presence: true

  scope :finished, -> {all.where(status: 1)}
  
  enum status: [:pending, :completed]
end
