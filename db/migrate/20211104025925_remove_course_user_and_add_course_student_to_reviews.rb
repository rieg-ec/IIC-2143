class RemoveCourseUserAndAddCourseStudentToReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :course_user
    add_reference :reviews, :course_student, index: true, foreign_key: true, null: false
  end
end
