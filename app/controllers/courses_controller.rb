# frozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!

  def show
    @lectures = course.lectures
    @reviews = course.reviews
    @is_student = student?
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def student?
    return true unless CourseStudent.where(student: current_user, course: course).empty?

    false
  end
end
