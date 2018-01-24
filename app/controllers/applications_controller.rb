class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @organizations = current_user.organizations
    @users = User.all
    @application = Application.new
    5.times { @application.experiences.build }
    5.times { @application.schedule_items.build }
    5.times { @application.roles.build }
  end

  def create
    @application = current_user.organizations.find(organization_params).applications.create(application_params)
    @organization  = current_user.organizations.find(organization_params)
  end

private
  def organization_params
    params.require(:application).require(:organization_id)
  end

  def application_params
    params.require(:application).permit( :name, :coordinator, :amount_applied_for, 
                                         :amount_other_sources, :amount_overall)
  end


end
