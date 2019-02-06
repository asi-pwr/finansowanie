# frozen_string_literal: true

FactoryBot.define do
  factory :schedule_item do
    application
    todo { "MyString" }
    start_date { "2017-06-08" }
    due_date { "2017-06-08" }
  end
end
