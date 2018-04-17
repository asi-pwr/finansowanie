# frozen_string_literal: true

FactoryBot.define do
  factory :faculty do
    sequence :name do |n|
      "Faculty #{n}"
    end
  end
end
