class Application < ApplicationRecord
  has_many :schedule_items
  has_many :user_applications
  has_many :users, through: :user_applications
  belongs_to :organization
  accepts_nested_attributes_for :users
  validates :name, presence: true
  validates :coordinator, presence: true
end
