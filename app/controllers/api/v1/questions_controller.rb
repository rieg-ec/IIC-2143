# frozen_string_literal: true

module Api
  module V1
    class QuestionsController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        respond_with Question.where(course_student: course_student)
      end

      def create
        respond_with Question.find_or_create_by(
          permitted_params.merge(course_student: course_student)
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
