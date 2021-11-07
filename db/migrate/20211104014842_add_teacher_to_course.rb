class AddTeacherToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :teacher, null: false, foreign_key: { to_table: :users }
  end
end
