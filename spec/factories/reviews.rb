# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    course_student
    rating { rand(0..5) }
    body { Faker::Lorem.paragraph(sentence_count: rand(4..36)) }
  end
end
