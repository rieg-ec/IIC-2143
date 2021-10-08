# frozen_string_literal: true

Faker::Config.locale = I18n.locale

module FakeDataLoader
  extend FactoryBot::Syntax::Methods

  def self.load
    load_admin
    load_courses
    true
  end

  def self.load_courses
    n = 20
    n.times do |i|
      create(:course, :with_teachers, :with_students, :with_questions, :with_reviews)
      Rails.logger.debug { "loading #{i}/#{n}" }
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
end
