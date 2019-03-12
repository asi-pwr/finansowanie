# frozen_string_literal: true

class ApplicationPolicy < RailsApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        user.applications
      end
    end
  end

  def update?
    user.admin?
  end
end
