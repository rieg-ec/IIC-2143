# frozen_string_literal: true

FactoryBot.define do
  factory :course_student do
    association :student, factory: :user
    course
  end
end
