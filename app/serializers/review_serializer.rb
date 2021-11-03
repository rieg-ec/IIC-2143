# frozen_string_literal: true

class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :body, :rating, :created_at
end
