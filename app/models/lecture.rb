# frozen_string_literal: true

class Lecture < ApplicationRecord
  has_one_attached :video
  has_one_attached :background

  belongs_to :course

  validates :video, presence: true

  def background_url
    default_background = 'https://picsum.photos/160/90'

    return default_background unless background.attached?

    rails_blob_path(background, only_path: true)
  end
end

# == Schema Information
#
# Table name: lectures
#
#  id          :bigint           not null, primary key
#  description :text
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  course_id   :bigint
#
# Indexes
#
#  index_lectures_on_course_id  (course_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#
