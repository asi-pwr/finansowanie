class ScheduleItem < ApplicationRecord
  belongs_to :application
  validates :todo, presence: true
end
