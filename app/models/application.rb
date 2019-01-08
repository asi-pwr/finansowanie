# frozen_string_literal: true

class Application < ApplicationRecord
  include AASM
  include ActiveModel::Validations

  has_many :experiences, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :schedule_items, dependent: :destroy
  has_many :user_applications, dependent: :destroy
  has_many :users, through: :user_applications, inverse_of: :application
  has_many_attached :files
  belongs_to :organization
  accepts_nested_attributes_for :experiences
  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :schedule_items
  accepts_nested_attributes_for :users
  validates :name, presence: true
  validates :coordinator, presence: true
  validates :amount_applied_for, presence: true, numericality: { greater_or_equal_to: 0 }
  validates :amount_other_sources, presence: true, numericality: { greater_or_equal_to: 0 }
  validates_date :date, on_or_before: lambda { Date.current }
  validates_with TotalSumValidator

  aasm do
    state :pending, initial: true
    state :accepted, :rejected

    event :accept do
      transitions from: :pending, to: :accepted
    end

    event :reject do
      transitions from: :pending, to: :rejected
    end
  end
end
