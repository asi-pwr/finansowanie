class Faculty < ApplicationRecord
  has_many :organizations
  validates :name, presence: true, uniqueness: true
  has_many :users
end
