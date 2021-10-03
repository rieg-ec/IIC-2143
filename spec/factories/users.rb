FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    trait :student do
      after(:create) { |user| user.add_role(:student) }
    end

    trait :teacher do
      after(:create) { |user| user.add_role(:teacher) }
    end
  end
end
