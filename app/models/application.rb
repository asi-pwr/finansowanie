class Application < ApplicationRecord
  validates :name, presence: true
  validates :coordinator, presence: true
end
