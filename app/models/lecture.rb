# frozen_string_literal: true

class Lecture < ApplicationRecord
  belongs_to :course, dependent: :destroy
end
