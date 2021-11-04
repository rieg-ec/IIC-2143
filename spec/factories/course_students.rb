# frozen_string_literal: true

FactoryBot.define do
  factory :course_student do
    association :student, factory: :user
    course

    trait :with_review do
      review
    end
  end
end
