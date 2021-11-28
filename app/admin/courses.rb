# frozen_string_literal: true

ActiveAdmin.register Course do
  includes :teacher
  permit_params :name, :category, :teacher_id, :end_date, :background

  sidebar 'Lectures Details', only: %i[show edit] do
    ul do
      li link_to 'Lectures', admin_course_lectures_path(resource)
    end
  end

  index do
    id_column
    column :name
    column :category
    column :teacher
    column :end_date
    column :updated_at
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :name
      row :category
      row :teacher
      row :end_date
      row :created_at
      row :updated_at
      row(:background) do |course|
        image_tag(course.background_url, width: '600')
      end

      table_for course.course_students do |_cs|
        column :id
        column(:name, &:student)
        column { |cs| link_to 'View', "/admin/course_students/#{cs.id}" }
      end
    end
  end

  filter :name
  filter :category
  filter :teacher

  form do |f|
    f.inputs do
      f.input :name
      f.input :category
      f.input :teacher
      f.input :end_date
      f.input :background, as: :file
    end
    f.actions
  end
end
