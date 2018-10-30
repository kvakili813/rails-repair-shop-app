class Job < ApplicationRecord
  belongs_to :customer
  belongs_to :repairman
  has_many :tickets, dependent: :destroy

  validates :customer_id, presence: true
  validates :repairman_id, presence: true

  def tickets_attributes=(attributes)
    self.save
    attributes.each do |k, v|
      order = Ticket.find_or_create_by(id: v[:id])
      order.update(description: v[:description], price: v[:price], job_id: self.id)
    end
  end

  def complete?
    self.tickets.all == self.tickets.all.where(status: 1)
  end

  def self.unfinished_jobs
    unfinished = []
    Job.all.each do |job|
      if !job.complete?
        unfinished << job
      end
    end
    unfinished
  end

  def self.finished_jobs
    finished = []
    Job.all.each do |job|
      if job.complete?
        finished << job
      end
    end
    finished
  end

end
