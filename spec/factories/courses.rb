# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { 'MyCourse' }
    category { %i[math sports food pets].sample }
    end_date { DateTime.current + 9.weeks }

    trait :with_students do
      after(:create) do |course|
        users_n = rand(2..6)
        users = create_list(:user, users_n)
        users_n.times do |i|
          create(:course_user, user: users[i], course: course)
        end
      end
    end

    trait :with_teachers do
      after(:create) do |course|
        users_n = rand(1..3)
        users = create_list(:user, users_n)
        users_n.times do |i|
          create(:course_user, :teacher, user: users[i], course: course)
        end
      end
    end

    trait :with_questions do
      after(:create) do |course|
        course_user = create(:course_user, course: course)
        create_list(:question, 3, course_user: course_user)
      end
    end

    trait :with_reviews do
      after(:create) do |course|
        rand(2..10).times do
          course_user = create(:course_user, course: course)
          create(:review, course_user: course_user)
        end
      end
    end

    trait :with_lectures do
      after(:create) do |course|
        rand(2..8).times do
          create(:lecture, course: course)
        end
      end
    end

    trait :inactive do
      end_date { DateTime.current - 2.weeks }
    end
  end
end
