# frozen_string_literal: true

FactoryBot.define do
  factory :project_member do
    function { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    application { nil }
  end
end
