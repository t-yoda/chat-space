FactoryBot.define do
  factory :message do
    text { Faker::Lorem.sentence }
    image { File.open("#{Rails.root}/public/images/test_image.jpg") }
    user
    group

    # created_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # updated_at { Faker::Time.between(from: DateTime.now - 2, to: DateTime.now) }
    # group_id { Faker::Number.between(from: 1, to: 3) }
  end
end