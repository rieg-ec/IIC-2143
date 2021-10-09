# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def update?
    admin? || current_user?
  end

  def edit?
    admin? || current_user?
  end

  def destroy?
    admin?
  end

  private

  def current_user?
    @record == @user
  end
end
