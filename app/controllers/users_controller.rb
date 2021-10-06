# frozen_string_literal: true

class UsersController < ApplicationController
  include Pundit

  def index
    @users = User.all
  end

  def show
    authorize user
  end

  def edit
    authorize user
  end

  def update
    authorize user
    return redirect_to user_path if user.update(update_params)

    render :edit
  end

  private

  def user
    @user ||= User.find(params[:id])
  end

  def update_params
    params.require(:user).permit(
      :avatar,
      :first_name,
      :last_name
    )
  end
end
