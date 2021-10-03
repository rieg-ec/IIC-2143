class AddAndRemoveReferencesToReviews < ActiveRecord::Migration[5.2]
  def change
    remove_reference :reviews, :user, foreign_key: true
    remove_reference :reviews, :course, foreign_key: true
    add_reference :reviews, :course_user
  end
end
