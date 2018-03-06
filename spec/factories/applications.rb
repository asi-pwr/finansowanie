# frozen_string_literal: true

FactoryGirl.define do
  factory :application do
    name "MyString"
    coordinator "MyString"
    association :organization
  end
end
