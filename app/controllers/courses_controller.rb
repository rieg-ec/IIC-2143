# frozen_string_literal: true

# fmonthsozen_string_literal: true

class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = Course.all
  end

  def show
    @lectures = course.lectures
    @reviews = course.reviews
    @is_student = student?
  end

  def register_student
    CourseUser.create!(role: :student, course: course, user: current_user)

    redirect_to courses_path
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def student?
    return true unless CourseUser.where(user: current_user, course: course).empty?

    false
  end
end
