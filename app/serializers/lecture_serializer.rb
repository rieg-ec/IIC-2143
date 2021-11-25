# frozen_string_literal: true

class LectureSerializer < BaseSerializer
  type :lecture

  attributes :id, :title, :description, :created_at, :updated_at, :video_url

  def created_at
    object.created_at.strftime('%Y-%m-%d')
  end

  def updated_at
    object.updated_at.strftime('%Y-%m-%d')
  end

  attribute(:course, if: -> { instance_options[:course] }) do
    object.course ? nested_resource(object.course) : nil
  end
end
