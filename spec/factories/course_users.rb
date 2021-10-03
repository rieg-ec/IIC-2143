# frozen_string_literal: true

FactoryBot.define do
  factory :course_user do
    user
    course
  end

  trait :student do
    role { :student }
  end

  trait :teacher do
    role { :teacher }
  end
end
