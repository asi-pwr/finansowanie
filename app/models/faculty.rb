# frozen_string_literal: true

class Faculty < ApplicationRecord
  has_many :organizations, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  has_many :users
end
