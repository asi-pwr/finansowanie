# frozen_string_literal: true

class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_application, only: %i[show update]

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  wrap_parameters include: [:selections, :decision, :organization_id], format: [:json, :xml, :url_encoded_form, :multipart_form]

  def index
    @applications = policy_scope(Application)
    @applications = @applications.order(:updated_at)
  end

  def new
    @organizations = current_user.organizations
    @users = User.all
    @application = Application.new
    @application.amount_applied_for = 0
    @application.amount_other_sources = 0
    3.times { @application.experiences.build }
    3.times { @application.schedule_items.build }
    3.times { @application.roles.build }
  end

  def create
    @organization = current_user.organizations.find(organization_params)
    @application = @organization.applications.new(application_params)
    if @application.save
      flash[:notice] = "Wniosek utworzony pomyslnie"
      redirect_to @application
    else
      flash[:alert] = "Nie utworzono wniosku"
      render 'new'
    end
  end

  def show
    @application = Application.find(params[:id])
  end

  # TODO: restrictions for fsm state transitions in form of
  # user errors i.e. "Application already accepted" or "Can't accept rejected"
  def update
    redirect_to applications_path
  end

  def bulk_action
    # You can access bulk_action_params[:application_ids] here
    # You also need to add this action to config/routes.rb
    
    @application = Application.find(params[:selections])
    authorize @application
    if params[:decision] == 'accept'
      @application.accept!
      flash[:notice] = "Zaakceptowano wniosek"
    elsif params[:decision] == 'reject'
      @application.reject!
      flash[:notice] = "Odrzucono wniosek"
    else
      flash[:alert] = "Nie można zmienić stanu!"
    end
    redirect_to @application
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

  def bulk_action_params
    params.require(:application).permit(application_ids: [])
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

  def user_not_authorized
    flash[:alert] = "Nie posiadasz uprawnień do wykonania tej operacji."
    redirect_to @application
  end

end
