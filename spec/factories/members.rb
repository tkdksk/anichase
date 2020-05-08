FactoryBot.define do
  factory :member do
    sequence(:email) { |n| "member#{n}@example.com" }
    name { "桃太郎" }
    password { "pw" }
  end
end