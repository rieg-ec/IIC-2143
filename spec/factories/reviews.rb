# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    course { nil }
    user { nil }
    rating { 1.5 }
    body { 'MyText' }
  end
end
