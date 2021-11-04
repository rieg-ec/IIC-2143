class AddReviewToCourseStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :course_students, :review, foreign_key: true
  end
end
