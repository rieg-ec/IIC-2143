# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    name { 'MyCourse' }
    category { %i[math sports food pets].sample }
    end_date { DateTime.current + 9.weeks }
    association :teacher, factory: :user

    trait :with_students do
      after(:create) do |course|
        users_n = rand(2..6)
        users = create_list(:user, users_n)
        users_n.times do |i|
          create(:course_student, student: users[i], course: course)
        end
      end
    end

    trait :with_questions do
      after(:create) do |course|
        course_student = create(:course_student, course: course)
        create_list(:question, 3, course_student: course_student)
      end
    end

    trait :with_reviews do
      after(:create) do |course|
        rand(2..10).times do
          course_student = create(:course_student, course: course)
          create(:review, course_student: course_student)
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
