# frozen_string_literal: true

ActiveAdmin.register Question do
  belongs_to :course_student

  permit_params :body, :course_student_id

  index do
    id_column
    column :body
    column(:course) { |q| q.course_student.course }
    column(:author) { |q| q.course_student.student }
    column :updated_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :body
      row(:course) { |q| q.course_student.course }
      row(:student) { |q| q.course_student.student }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :body
    end
    f.actions
  end
end
