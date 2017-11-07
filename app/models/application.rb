class Application < ApplicationRecord
  has_many :schedule_items
  has_many :users, through: :users_applications
  belongs_to :organization
  validates :name, presence: true
  validates :coordinator, presence: true
end
