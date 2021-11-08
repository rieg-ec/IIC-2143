# frozen_string_literal: true

FactoryBot.define do
  factory :lecture do
    course
    title { 'MyString' }
    description { Faker::Lorem.paragraph(sentence_count: 4, random_sentences_to_add: 5) }
    video { Rack::Test::UploadedFile.new('spec/assets/test-video.mp4', 'image/png') }
  end
end
