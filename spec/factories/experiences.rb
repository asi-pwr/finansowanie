# frozen_string_literal: true

FactoryBot.define do
  factory :experience do
    application
    project_name { "MyString" }
    role { "MyString" }
    project_date { "2017-06-08" }
    budget { 188 }
    member_name { "MyString" }
  end
end
