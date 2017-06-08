class CoordinatorsProject < ApplicationRecord
  belongs_to :application
  validates :name, presence: true
  validates :function, presence: true
  validates :date, presence: true
  validates :budget, presence: true
end
