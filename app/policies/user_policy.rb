# frozen_string_literal: true

class UserPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    admin? || current_user?
  end

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
