# frozen_string_literal: true

class Lecture < ApplicationRecord
  belongs_to :course
end

# == Schema Information
#
# Table name: lectures
#
#  id         :bigint           not null, primary key
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint
#
# Indexes
#
#  index_lectures_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
