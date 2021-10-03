# frozen_string_literal: true

FactoryBot.define do
  factory :question do
    course
    user
    body { 'MyText' }
  end
end
