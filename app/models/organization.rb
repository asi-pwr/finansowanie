class Organization < ApplicationRecord
  belongs_to :faculty
  has_many :users, through: :users_organizations
  has_many :applications
  validates :name, presence: true, uniqueness: true
  validates :time_of_establishment, presence: true
end
