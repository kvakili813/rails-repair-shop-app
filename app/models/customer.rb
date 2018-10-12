class Customer < ApplicationRecord
  has_many :jobs
  has_many :repairmen, through: :jobs

  validates :name, presence: true, uniqueness: :true

end
