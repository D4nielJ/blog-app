FactoryBot.define do
  factory :post do
    title { Faker::Movies::StarWars.character }
    text { Faker::Lorem.sentence }
    comments_counter { Faker::Number.within(range: 1..10) }
    likes_counter { Faker::Number.within(range: 1..10) }
    author_id { Faker::Number.within(range: 1..10) }
  end
end
