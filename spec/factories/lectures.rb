# frozen_string_literal: true

FactoryBot.define do
  factory :lecture do
    course { nil }
    title { 'MyString' }
  end
end
