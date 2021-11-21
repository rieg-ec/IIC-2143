# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :course_student

  validates :rating,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 5
            }
end

# == Schema Information
#
# Table name: reviews
#
#  id                :bigint           not null, primary key
#  body              :text
#  rating            :float
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  course_student_id :bigint           not null
#
# Indexes
#
#  index_reviews_on_course_student_id  (course_student_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_student_id => course_students.id)
#
