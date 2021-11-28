# frozen_string_literal: true

ActiveAdmin.register Review do
  belongs_to :course_student

  permit_params :body, :rating, :course_student_id

  controller do
    def index
      @reviews = Review.find_by(course_student_id: params[:course_student_id])
    end
  end

  show do
    attributes_table do
      row :id
      row :body
      row :rating
      row(:course) { |r| r.course_student.course }
      row(:student) { |r| r.course_student.student }
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :body
      f.input :rating
    end
    f.actions
  end
end
