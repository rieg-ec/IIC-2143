# frozen_string_literal: true

module Api
  module V1
    class CoursesController < Api::V1::BaseController
      before_action :authenticate_user!

      def index
        respond_with Course.all
      end

      def show
        respond_with Course.find(params[:id])
      end

      def register
        respond_with CourseStudent.find_or_create_by!(course: course, student: current_user)
      end

      private

      def student?
        return true unless CourseStudent.where(student: current_user, course: course).empty?

        false
      end

      def course
        @course ||= Course.find(params[:id])
      end
    end
  end
end
