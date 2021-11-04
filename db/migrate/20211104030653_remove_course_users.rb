class RemoveCourseUsers < ActiveRecord::Migration[5.2]
  def change
    drop_table :course_users
  end
end
