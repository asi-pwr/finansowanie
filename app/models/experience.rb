# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :application
  validates :project_name, presence: true
  validates :role, presence: true
  validates :project_date, presence: true
  validates_date :project_date, :on_or_before => lambda { Date.current }
  validates :budget, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :member_name, presence: true
end
