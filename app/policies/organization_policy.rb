# frozen_string_literal: true

class OrganizationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if !user.nil?
        if user.admin?
          scope.all
        else
          user.organizations
        end
      else
        []
      end
    end
  end

  def index?
    if !user.nil?
      user.admin?
    else
      false
    end
  end

  def update?
    if !user.nil?
      user.admin?
    else
      false
    end
  end

  def show?
    if !user.nil?
      user.admin?
    else
      false
    end
  end

  def edit?
    if !user.nil?
      user.admin?
    else
      false
    end
  end

  def create?
    if !user.nil?
      user.admin?
    else
      false
    end
  end

  def destroy?
    if !user.nil?
      user.admin?
    else
      false
    end
  end
end
