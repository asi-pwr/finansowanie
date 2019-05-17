# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:full_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    admin { false }
  end
end
