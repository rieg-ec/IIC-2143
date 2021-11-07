# frozen_string_literal: true

class FullCourseSerializer < ActiveModel::Serializer
  self.root = 'course'

  attributes :id, :name, :category, :background_url, :duration,
             :average_rating

  has_one :teacher, serializer: UserSerializer
  has_many :reviews
  has_many :questions
  has_many :lectures
end
