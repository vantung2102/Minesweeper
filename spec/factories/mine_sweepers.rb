FactoryBot.define do
  factory :mine_sweeper do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    width { Faker::Number.between(from: 5, to: 9) }
    height { Faker::Number.between(from: 5, to: 9) }
    mines { Faker::Number.between(from: 1, to: 10) }
  end
end
