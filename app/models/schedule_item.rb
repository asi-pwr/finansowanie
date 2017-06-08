class ScheduleItem < ApplicationRecord
  belongs_to :application
  validates :todo, presence: true
  validates :start_date, presence: true
  validates :due_date, presence: true
  validates :finance_source, presence: true
  validates :budget_amount, presence: true
end
