# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    category { 'MyString' }

    trait :with_students do
      after(:create) do |course|
        create_list(:user, 5, :student, course: course)
      end
    end

    trait :with_teachers do
      after(:create) do |course|
        create_list(:user, 3, :teacher, course: course)
      end
    end
  end
end
