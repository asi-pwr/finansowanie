class Application < ApplicationRecord
  has_many :coordinators_projects
  has_many :schedule_items
  validates :name, presence: true
  validates :coordinator, presence: true
end
