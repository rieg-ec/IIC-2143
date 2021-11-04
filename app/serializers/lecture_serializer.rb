# frozen_string_literal: true

class LectureSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :created_at, :updated_at
end
