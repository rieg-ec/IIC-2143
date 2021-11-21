# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @courses_owned = Course.includes(:reviews).where(teacher: current_user)
    @courses_enrolled = Course
                        .includes(:course_students, :reviews)
                        .where(course_students: { student_id: current_user.id })
  end

  def edit; end

  def update
    return redirect_to user_path if user.update(update_params)

    render :edit
  end

  private

  def update_params
    params.require(:user).permit(
      :avatar,
      :first_name,
      :last_name
    )
  end
end
