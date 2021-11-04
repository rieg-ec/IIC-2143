class RemoveCourseUserAndAddCourseStudentToQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :questions, :course_user
    add_reference :questions, :course_student, index: true, foreign_key: true, null: false
  end
end
