# frozen_string_literal: true

FactoryBot.define do
  factory :organization do
    sequence(:name) do |n|
      "Organization #{n}"
    end
    time_of_establishment { Date.new(2017, 6, 8) }
    faculty
  end
end
