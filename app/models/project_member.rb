class ProjectMember < ApplicationRecord
  belongs_to :application
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :function, presence: true
end
