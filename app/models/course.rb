# frozen_string_literal: true

class Course < ApplicationRecord
  extend Enumerize

  CATEGORIES = %i[
    math sports pets food
  ].freeze

  enumerize :category, in: CATEGORIES

  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users
  has_many :students, lambda {
                        where(course_users: { role: :student })
                      }, through: :course_users, source: :user, inverse_of: :courses_enrolled
  has_many :teachers, lambda {
                        where(course_users: { role: :teacher })
                      }, through: :course_users, source: :user, inverse_of: :courses_owned

  has_many :reviews, through: :course_users, source: :review, dependent: :destroy
  has_many :questions, through: :course_users, source: :question, dependent: :destroy
  has_many :lectures, dependent: :destroy

  scope :active, -> { where('end_date < ?', DateTime.current) }

  def duration
    (Date.parse(created_at.to_s)..end_date).count / 7
  end
end

# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  category   :string
#  end_date   :date
#  created_at :datetime         not null
#  updated_at :datetime         not null
#