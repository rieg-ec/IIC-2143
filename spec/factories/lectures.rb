# frozen_string_literal: true

FactoryBot.define do
  factory :lecture do
    course
    title { 'MyString' }
  end
end
