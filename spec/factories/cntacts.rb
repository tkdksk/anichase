FactoryBot.define do
  factory :contact do
    sequence(:email) { |n| "contact#{n}@example.com" }
    name { "桃太郎" }
    content { "aaa" }
  end
end