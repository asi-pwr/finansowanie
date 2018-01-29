# frozen_string_literal: true

class ScheduleItem < ApplicationRecord
  belongs_to :application
  validates :todo, presence: true
  validates :start_date, presence: true
  validates :due_date, presence: true
end
