# frozen_string_literal: true

class Api::V1::QuestionsController < Api::V1::BaseController
  before_action :authenticate_user!

  def index
    course = Course.includes(:questions, :students).find(params[:course_id])

    respond_with(course.questions, author: true)
  end

  def create
    respond_with(
      Question
        .includes(course_student: :student)
        .create!(permitted_params.merge(course_student: course_student)),
      author: true
    )
  end

  def destroy
    respond_with Question.destroy(params[:id])
  end

  private

  def course_student
    @course_student ||= CourseStudent.find_by(
      student: current_user,
      course_id: params[:course_id]
    )
  end

  def permitted_params
    params.require(:question).permit(:body)
  end
end
