# frozen_string_literal: true

class QuestionSerializer < BaseSerializer
  attributes :id, :body, :created_at, :updated_at, :course_student_id

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end

  def updated_at
    object.updated_at.strftime('%Y-%m-%d')
  end

  attribute(:author, if: -> { instance_options[:author] }) do
    nested_resource(object.course_student.student)
  end
end
