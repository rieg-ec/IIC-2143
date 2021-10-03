class AddAndRemoveReferencesToQuestions < ActiveRecord::Migration[5.2]
  def change
    remove_reference :questions, :user, foreign_key: true
    remove_reference :questions, :course, foreign_key: true
    add_reference :questions, :course_user, foreign_key: true
  end
end
