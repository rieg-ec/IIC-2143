# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    course { nil }
    user { nil }
    body { 'MyText' }
  end
end
