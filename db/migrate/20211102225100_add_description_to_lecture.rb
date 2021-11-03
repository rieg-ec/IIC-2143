class AddDescriptionToLecture < ActiveRecord::Migration[5.2]
  def change
    add_column :lectures, :description, :text
  end
end
