FactoryBot.define do
  factory :post do
    text { Faker::Lorem.sentence }
    author_id { Faker::Number.number(10) }
    post_id nil
  end
end
