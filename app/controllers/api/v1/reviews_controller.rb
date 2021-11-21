# frozen_string_literal: true

module Api
  module V1
    class ReviewsController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        reviews = Review.includes(course_student: :student).where(course_student: course_student)
        respond_with(reviews, author: true)
      end

      def show
        respond_with Review.find(params[:id])
      end

      def create
        respond_with(
          Review
            .includes(course_student: :student)
            .find_or_create_by(permitted_params.merge(course_student: course_student)),
          author: true
        )
      end

      def destroy
        respond_with Review.destroy(params[:id])
      end

      private

      def course_student
        @course_student ||= CourseStudent.find_by(
          student: current_user,
          course_id: params[:course_id]
        )
      end

      def permitted_params
        params.require(:review).permit(:body, :rating)
      end
    end
  end
end
