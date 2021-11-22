# frozen_string_literal: true

class LecturesController < ApplicationController
  before_action :authenticate_user!

  def show
    @lecture = Lecture.find(params[:id])
  end

  def create; end

  def destroy; end

  private

  def lecture
    @lecture ||= Lecture.find(params[:id])
  end
end
