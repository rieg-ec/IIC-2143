# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    course_student
    rating { rand(0..5) }
    body { 'MyText' }
  end
end
