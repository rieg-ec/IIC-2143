# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :course_student
end

# == Schema Information
#
# Table name: questions
#
#  id                :bigint           not null, primary key
#  body              :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  course_student_id :bigint           not null
#
# Indexes
#
#  index_questions_on_course_student_id  (course_student_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_student_id => course_students.id)
#
