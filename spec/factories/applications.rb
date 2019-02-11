# frozen_string_literal: true

FactoryBot.define do
  factory :application do
    name { "MyString" }
    coordinator { "MyString" }
    amount_applied_for { 1 }
    amount_other_sources { 1 }
    amount_overall { 2 }
    date { 1.day.ago }
    association :organization
  end
end
