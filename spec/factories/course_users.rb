FactoryBot.define do
  factory :course_user do
    user_id { nil }
    course_id { nil }
    role { "MyString" }
  end
end
