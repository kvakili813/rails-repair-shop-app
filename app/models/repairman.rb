class Repairman < ApplicationRecord
  has_many :customers, through: :jobs
  has_many :jobs
end
