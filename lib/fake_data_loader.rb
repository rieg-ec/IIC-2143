# frozen_string_literal: true

Faker::Config.locale = I18n.locale

module FakeDataLoader
  extend FactoryBot::Syntax::Methods

  USER_PASS = 12_345_678

  def self.load
    load_admin
    load_user
    true
  end

  def self.load_courses
    5.times do
      create(:course, :with_teachers, :with_students, :with_questions, :with_reviews)
    end
  end

  def self.load_admin
    email = 'admin@example.com'
    pass = 'password'
    admin = AdminUser.find_by(email: email)
    admin ||= AdminUser.create!(
      email: email,
      password: pass,
      password_confirmation: pass,
      first_name: 'John',
      last_name: 'Doe'
    )
    Rails.logger.debug { "admin: #{admin.email} - pass: #{pass}" }
  end

  def self.load_user
    email = 'user@example.com'
    pass = USER_PASS
    user = User.find_by(email: email)
    user ||= User.create(email: email, password: pass, first_name: 'Jhon', last_name: 'Doe')
    Rails.logger.debug { "user: #{user.email} = pass: #{pass}" }
  end
end
