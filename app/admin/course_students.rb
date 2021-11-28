# frozen_string_literal: true

ActiveAdmin.register CourseStudent do
  menu parent: 'Courses'

  permit_params :course_id, :student_id

  sidebar 'Course Student Details', only: %i[show edit] do
    ul do
      li link_to 'Questions', admin_course_student_questions_path(resource)
    end
  end

  index do
    id_column
    column :id
    column :course
    column :student
    column :updated_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row(:name, &:student)
      row :course
      row :updated_at
      row :created_at
      table_for course_student.review do
        column :id
        column :body
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :course
      f.input :student
    end
    f.actions
  end
end
