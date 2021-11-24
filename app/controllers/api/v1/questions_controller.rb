# frozen_string_literal: true

module Api
  module V1
    class QuestionsController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        questions = Question.includes(course_student: :student).where(course_student: course_student)
        respond_with(questions, author: true)
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
  end
end
