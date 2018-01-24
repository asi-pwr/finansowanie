class Application < ApplicationRecord
  has_many :experiences
  has_many :roles
  has_many :schedule_items
  has_many :user_applications
  has_many :users, through: :user_applications
  belongs_to :organization
  accepts_nested_attributes_for :experiences
  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :schedule_items
  accepts_nested_attributes_for :users
  validates :name, presence: true
  validates :coordinator, presence: true
end
