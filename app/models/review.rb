# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :course
  belongs_to :user
end
