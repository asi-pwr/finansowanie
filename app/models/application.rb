# frozen_string_literal: true

class Application < ApplicationRecord
  include ActiveModel::Validations
  has_many :experiences, dependent: :destroy
  has_many :roles, dependent: :destroy
  has_many :schedule_items, dependent: :destroy
  has_many :user_applications, dependent: :destroy
  has_many :users, through: :user_applications, inverse_of: :application
  belongs_to :organization
  accepts_nested_attributes_for :experiences
  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :schedule_items
  accepts_nested_attributes_for :users
  validates :name, presence: true
  validates :coordinator, presence: true
  validates_with TotalSumValidator
  validates :amount_applied_for, numericality: {greater_or_equal_to: 0}
  validates :amount_other_sources, numericality: {greater_or_equal_to: 0}



end
