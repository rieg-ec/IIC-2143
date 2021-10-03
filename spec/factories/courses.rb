# frozen_string_literal: true

FactoryBot.define do
  factory :course do
    category { :math }
    end_date { DateTime.current + 9.weeks }

    trait :with_students do
      after(:create) do |course|
        users_n = 5
        users = create_list(:user, users_n)
        users_n.times do |i|
          course_user = create(:course_user, :student, user: users[i], course: course)
        end
      end
    end

    trait :with_teachers do
      after(:create) do |course|
        create_list(:user, 3, :teacher, course: course)
      end
    end

    trait :with_questions do
      after(:create) do |course|
        create_list(:question, 3, course: course, user: course.users.first)
      end
    end

    trait :inactive do
      end_date { DateTime.current - 2.weeks }
    end
  end
end
