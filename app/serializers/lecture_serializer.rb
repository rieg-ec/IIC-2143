# frozen_string_literal: true

class LectureSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :updated_at,
             :background_url
end
