# frozen_string_literal: true

FactoryGirl.define do
  factory :user do
    full_name "Testowy Użytkownik"
    sequence :email do |n|
      "user#{n}@example.com"
    end
    password "qweasdzxc"
  end
end
