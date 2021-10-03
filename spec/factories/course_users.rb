# frozen_string_literal: true

FactoryBot.define do
  factory :course_user do
    user
    course
    role { :student }
  end

  trait :teacher do
    role { :teacher }
  end
end
