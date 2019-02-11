# frozen_string_literal: true

FactoryBot.define do
  factory :schedule_item do
    application
    todo { "MyString" }
    start_date { 2.years.ago }
    due_date { 2.years.ago }
  end
end
