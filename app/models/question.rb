# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :course_user
  has_one :author, through: :course_user, source: :user, inverse_of: :questions
end

# == Schema Information
#
# Table name: questions
#
#  id             :bigint           not null, primary key
#  body           :text
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_user_id :bigint
#
# Indexes
#
#  index_questions_on_course_user_id  (course_user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_user_id => course_users.id)
#
