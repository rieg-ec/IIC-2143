# frozen_string_literal: true

module Api
  module V1
    class ReviewsController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        return respond_api_error(:bad_request, message: 'missing course_id param') unless params[:course_id]

        respond_with Review.find_by(course_student: course_student)
      end

      def show
        respond_with Review.find(params[:id])
      end

      def create
        respond_with Review.find_or_create_by(
          permitted_params.merge(course_student: course_student)
        )
      end

      def destroy
        respond_with Review.destroy(params[:id])
      end

      private

      def course_student
        course = Course.find(params[:course_id])
        @course_student ||= CourseStudent.find_by(student: current_user, course: course)
      end

      def permitted_params
        params.require(:review).permit(:body, :rating)
      end
    end
  end
end
