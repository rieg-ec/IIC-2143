# frozen_string_literal: true

class ReviewSerializer < BaseSerializer
  type :review

  attributes :id, :body, :rating, :updated_at, :created_at, :course_student_id

  attribute(:author, if: -> { instance_options[:author] }) do
    nested_resource(object.course_student.student)
  end
end
