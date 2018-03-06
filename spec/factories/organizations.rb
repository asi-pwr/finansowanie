# frozen_string_literal: true

FactoryGirl.define do
  factory :organization do
    sequence(:name) do |n|
      "Organization #{n}"
    end
    time_of_establishment "2017-06-08"
    association :faculty
  end
end
