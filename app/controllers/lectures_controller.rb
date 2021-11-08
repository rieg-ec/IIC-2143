# frozen_string_literal: true

class LecturesController < ApplicationController
  before_action :authenticate_user!

  def show
    @course = lecture.course
  end

  def create; end

  def destroy; end

  private

  def lecture
    @lecture ||= Lecture.find(params[:id])
  end
end
