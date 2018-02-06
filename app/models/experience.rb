# frozen_string_literal: true

class Experience < ApplicationRecord
  belongs_to :application
  validates :project_name, presence: true
  validates :role, presence: true
  validates :project_date, presence: true
  validates :budget, presence: true
  validates :member_name, presence: true
end
