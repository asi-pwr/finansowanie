# frozen_string_literal: true

FactoryBot.define do
  factory :user_application do
    association :user, factory: :user, strategy: :build
    association :application, factory: :application, strategy: :build
  end
end
