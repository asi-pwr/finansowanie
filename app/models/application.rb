class Application < ApplicationRecord
  has_many :coordinators_projects
  validates :name, presence: true
  validates :coordinator, presence: true
end
