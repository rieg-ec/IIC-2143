# frozen_string_literal: true

class Lecture < ApplicationRecord
  has_one_attached :video

  belongs_to :course

  validates :video, presence: true

  def video_url
    Rails.application.routes.url_helpers.rails_blob_url(video, only_path: true)
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
