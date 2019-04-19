# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :full_name do |n|
      "user#{n}"
    end
    sequence :email do |n|
      "user#{n}@example.com"
    end
    sequence :password do |n|
      password { "password_#{n}" }
    end
    admin { false }
  end
end
