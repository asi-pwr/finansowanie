# frozen_string_literal: true

class Organization < ApplicationRecord
  belongs_to :faculty
  has_many :user_organizations, dependent: :destroy
  has_many :users, through: :user_organizations, dependent: :destroy
  has_many :applications, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :time_of_establishment, presence: true
end
