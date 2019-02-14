# frozen_string_literal: true

FactoryBot.define do
  factory :role do
    application
    member_role { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
  end
end
