# frozen_string_literal: true

class Course < ApplicationRecord
  extend Enumerize

  CATEGORIES = %i[
    math sports pets cooking
  ].freeze

  enumerize :category, in: CATEGORIES

  has_many :course_users, dependent: :destroy
  has_many :users, through: :course_users

  has_many :reviews, dependent: :destroy
  has_many :lectures, dependent: :destroy
  has_many :questions,  dependent: :destroy
end

# == Schema Information
#
# Table name: courses
#
#  id         :bigint           not null, primary key
#  category   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
