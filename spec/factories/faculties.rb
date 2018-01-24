# frozen_string_literal: true

FactoryGirl.define do
  factory :faculty do
    sequence :name do |n|
      "Faculty #{n}"
    end
  end
end
