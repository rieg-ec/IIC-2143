# frozen_string_literal: true

ActiveAdmin.register Lecture do
  menu parent: 'Courses'

  belongs_to :course

  permit_params :title, :description, :course_id, :video

  index do
    id_column
    column :title
    column :description
    column :course
    column :updated_at
    column :created_at
    actions
  end

  filter :title
  filter :description
  filter :course

  show do
    attributes_table do
      row :id
      row :title
      row :description
      row :course
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :description
      f.input :course
      f.input :video, as: :file
    end
    f.actions
  end
end
