# frozen_string_literal: true

class CourseSerializer < BaseSerializer
  type :course

  attributes :id, :name, :category, :background_url, :duration

  attribute(:teacher, if: -> { instance_options[:teacher] }) do
    object.teacher ? nested_resource(object.teacher) : nil
  end

  attribute(:reviews, if: -> { instance_options[:reviews] }) do
    object.reviews ? nested_resources(object.reviews) : nil
  end

  attribute(:questions, if: -> { instance_options[:questions] }) do
    object.questions ? nested_resources(object.questions) : nil
  end

  attribute(:lectures, if: -> { instance_options[:lectures] }) do
    object.lectures ? nested_resources(object.lectures) : nil
  end

  attribute(:students, if: -> { instance_options[:students] }) do
    object.students ? nested_resources(object.students) : nil
  end
end
