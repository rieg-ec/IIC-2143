class CreateCourseStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :course_students do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
