class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :course, foreign_key: true
      t.references :user, foreign_key: true
      t.float :rating
      t.text :body

      t.timestamps
    end
  end
end
