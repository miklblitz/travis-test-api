FactoryBot.define do
  factory :good do
    name { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.number(6) }
  end
end