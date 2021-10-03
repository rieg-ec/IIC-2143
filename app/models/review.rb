# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :course_user
  has_one :author, through: :course_user, source: :user
end

# == Schema Information
#
# Table name: reviews
#
#  id             :bigint           not null, primary key
#  body           :text
#  rating         :float
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  course_user_id :bigint
#
# Indexes
#
#  index_reviews_on_course_user_id  (course_user_id)
#
