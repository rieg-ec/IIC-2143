class AddDurationToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :end_date, :date
  end
end
