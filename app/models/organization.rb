# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :faculty
  has_many :user_organizations, dependent: :destroy
  has_many :users, -> { distinct }, through: :user_organizations, inverse_of: :organizations, dependent: :destroy
  has_many :applications, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :time_of_establishment, presence: true
  validates_date :time_of_establishment, :on_or_before => lambda { Date.today }
end
