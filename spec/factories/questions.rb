# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    course_student
    body { Faker::Lorem.question(word_count: rand(6..36)) }
  end
end
