FactoryBot.define do
  factory :court do
    text {Faker::Lorem.sentence}
    image {Faker::Lorem.sentence}
    association :user
  end
end
