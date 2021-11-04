# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    course_student
    body { 'MyText' }
  end
end
