FactoryBot.define do
  factory :comment do
    text { Faker::Lorem.sentence }
    author_id { Faker::Number.within(range: 1..10) }
    post_id { nil }
  end
end
