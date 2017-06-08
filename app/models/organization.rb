class Organization < ApplicationRecord
  belongs_to :faculty
  validates :name, presence: true, uniqueness: true
  validates :time_of_establishment, presence: true
end
