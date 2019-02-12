FactoryBot.define do
  factory :user_organization do
   association :user, factory: :user, strategy: :build
   association :organization, factory: :organization, strategy: :build 
  end
end
