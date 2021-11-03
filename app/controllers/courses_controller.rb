# frozen_string_literal: true

# fmonthsozen_string_literal: true

class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def show
    @lectures = course.lectures
    @reviews = course.reviews
    @is_student = student?
  end

  def register_student
    if CourseUser.create!(role: :student, course: course, user: current_user)
      redirect_to course_path(course)
    else
      redirect_to courses_path
    end
  end

  private

  def course
    @course ||= Course.find(params[:id])
  end

  def student?
    return true if CourseUser.where(user: current_user, course: course)

    false
  end
end
