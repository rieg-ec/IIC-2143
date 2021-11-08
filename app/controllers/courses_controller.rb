# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!

  def show
    @lectures = course.lectures
    @reviews = course.reviews
    @is_student = student?
  end

  def new; end

  def create
    @course = Course.new(
      course_params.merge(teacher: current_user)
    )
    if @course.save
      redirect_to course_path(@course)
    else
      render :new
    end
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:category, :name, :end_date)
  end

  def student?
    return true unless CourseStudent.where(student: current_user, course: course).empty?

    false
  end
end
