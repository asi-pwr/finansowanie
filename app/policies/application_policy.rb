# frozen_string_literal: true

class ApplicationPolicy < RailsApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        # get applications from organizations that user belongs to
        organization_ids = []
        user.organizations.each do |org|
          organization_ids << org.id
        end
        scope.where(organization_id: organization_ids)
      end
    end
  end

  def update?
    user.admin?
  end

  def bulk_action?
    user.admin?
  end
end
