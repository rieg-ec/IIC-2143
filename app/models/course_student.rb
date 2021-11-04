# frozen_string_literal: true

class CourseStudent < ApplicationRecord
  belongs_to :student, class_name: 'User'
  belongs_to :course

  has_one :review, dependent: :destroy
  has_many :questions, dependent: :destroy
end

# == Schema Information
#
# Table name: course_students
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_course_students_on_course_id   (course_id)
#  index_course_students_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (student_id => users.id)
#
