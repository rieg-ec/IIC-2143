# frozen_string_literal: true

class LectureSerializer < BaseSerializer
  attributes :id, :title, :description, :created_at, :updated_at, :video_url

  attribute(:course, if: -> { instance_options[:course] }) do
    object.course ? nested_resource(object.course) : nil
  end
end
