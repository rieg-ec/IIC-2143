FactoryBot.define do
  factory :question do
    course { nil }
    user { nil }
    body { "MyText" }
  end
end
