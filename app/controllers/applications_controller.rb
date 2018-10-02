# frozen_string_literal: true

class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @organizations = current_user.organizations
    @users = User.all
    @application = Application.new
    3.times { @application.experiences.build }
    3.times { @application.schedule_items.build }
    3.times { @application.roles.build }
  end

  def create
    @organization = current_user.organizations.find(organization_params)
    @application = @organization.applications.create(application_params)
    flash[:notice] = "Wniosek utworzony pomyslnie"
  end

  private

  def organization_params
    params.require(:application).require(:organization_id)
  end

  def application_params
    params.require(:application).permit(
      :name,
      :coordinator,
      :user_id,
      :amount_applied_for,
      :amount_other_sources,
      :amount_overall,
      :organization_id,
      :description,
      :location,
      :date,
      :required_resources,
      :past_schedule,
      :collaborations,
      :target_group,
      :sponsor_enlistment,
      :promotion_plans,
      :current_state,
      :project_subject,
      :collaboration,
      experiences_attributes: %i[project_name role budget project_date member_name],
      schedule_items_attributes: %i[todo start start_date due_date],
      roles_attributes: %i[member_role first_name last_name], 
      files: []
    )
  end
end
