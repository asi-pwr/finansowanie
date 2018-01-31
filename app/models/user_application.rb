# frozen_string_literal: true

class UserApplication < ApplicationRecord
  belongs_to :user, inverse_of: :user_applications
  belongs_to :application, inverse_of: :user_applications
end
