FactoryBot.define do
  factory :post do
    title { Faker::StarWars.character }
    text { Faker::Lorem.sentence }
    comments_counter { Faker::Number.number(10) }
    likes_counter { Faker::Number.number(10) }
    author_id { Faker::Number.number(10) }
  end
end
