# frozen_string_literal: true

class CourseSerializer < ActiveModel::Serializer
  attributes :id, :name, :category, :background_url, :duration
end
