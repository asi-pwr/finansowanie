class Role < ApplicationRecord
  belongs_to :application
  validates :member_role, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
end
