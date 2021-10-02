class CourseUser < ApplicationRecord
  extend Enumerize

  belongs_to :user
  belongs_to :course

  validates :user, :course, :role, presence: true

  enumerize :role, in: [:student, :teacher]
end

# == Schema Information
#
# Table name: course_users
#
#  id         :bigint           not null, primary key
#  role       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_course_users_on_course_id  (course_id)
#  index_course_users_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (course_id => courses.id)
#  fk_rails_...  (user_id => users.id)
#
