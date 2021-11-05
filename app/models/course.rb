# frozen_string_literal: true

class Course < ApplicationRecord
  extend Enumerize

  CATEGORIES = %i[
    math sports pets food
  ].freeze

  enumerize :category, in: CATEGORIES

  has_many :course_students, dependent: :destroy
  belongs_to :teacher, class_name: 'User'
  has_many :students, through: :course_students, source: :student, inverse_of: :courses_enrolled

  has_many :reviews, through: :course_students, source: :review, dependent: :destroy
  has_many :questions, through: :course_students, source: :questions, dependent: :destroy
  has_many :lectures, dependent: :destroy

  scope :active, -> { where('end_date < ?', DateTime.current) }

  has_one_attached :background

  def duration
    (Date.parse(created_at.to_s)..end_date).count / 7
  end

  def background_url
    default_background = 'https://picsum.photos/1920/1080'

    return default_background unless background.attached?

    rails_blob_path(background, only_path: true)
  end

  def average_rating
    return 0 if reviews.empty?

    reviews.average(:rating).round(1)
  end
end

# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  category   :string
#  end_date   :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  teacher_id :bigint           not null
#
# Indexes
#
#  index_courses_on_teacher_id  (teacher_id)
#
# Foreign Keys
#
#  fk_rails_...  (teacher_id => users.id)
#
