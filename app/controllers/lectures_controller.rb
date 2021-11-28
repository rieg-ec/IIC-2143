# frozen_string_literal: true

class LecturesController < ApplicationController
  before_action :authenticate_user!

  def show
    @lecture = Lecture.find(params[:id])
  end

  def new
    @course = Course.includes(:lectures).find(params[:course_id])
  end

  def create
    Lecture.create!(lecture_params.merge(course_id: params[:course_id]))

    redirect_to course_path(params[:course_id])
  end

  def destroy; end

  private

  def lecture
    @lecture ||= Lecture.find(params[:id])
  end

  def lecture_params
    params.require(:lecture).permit(
      :title,
      :description,
      :video
    )
  end
end
