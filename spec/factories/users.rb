FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "#{n}@example.com"
    end
    password "qweasdzxc"
  end
end
