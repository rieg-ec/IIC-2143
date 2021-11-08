# frozen_string_literal: true

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :created_at, :author_name

  def author_name
    object.course_student.student.full_name
  end
end
