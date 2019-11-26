# frozen_string_literal: true

class ApplicationsController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError do |_exception|
    flash[:alert] = t("pundit.errors.user_not_authorized")
    redirect_to request.referer || root_path
  end
  before_action :authenticate_user!
  before_action :set_application, only: %i[show update]
  after_action :verify_policy_scoped
  after_action :verify_authorized, only: :update

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  wrap_parameters include: %i[selections decision organization_id], format: %i[json xml url_encoded_form multipart_form]

  def index
    @applications = policy_scope(Application)
    @applications = @applications.order(:updated_at)
  end

  def new
    @organization = policy_scope(Organization)
    @users = User.all
    @application = Application.new
    @application.amount_applied_for = 0
    @application.amount_other_sources = 0
    @application.amount_overall = 0
    3.times { @application.experiences.build }
    3.times { @application.schedule_items.build }
    3.times { @application.roles.build }
  end

  def create
    @organization = policy_scope(Organization).find(application_params[:organization_id])
    @application = @organization.applications.new(application_params)
    if @application.save
      flash[:notice] = t('applications.form.created_successfully')
      redirect_to @application
    else
      flash[:alert] = t('.not_created')
      render 'new'
    end
  end

  def edit
    @organization = policy_scope(Organization)
    @users = User.all
    @application = policy_scope(Application).find(params[:id])
  end

  def show
    @application = policy_scope(Application).find(params[:id])
  end

  # TODO: restrictions for fsm state transitions in form of
  # user errors i.e. "Application already accepted" or "Can't accept rejected"
  def update
    @application = policy_scope(Application).find(params[:id])

    @application.schedule_items.clear
    @application.experiences.clear
    @application.roles.clear

    policy_scope(Application).update(@application.id ,application_params)
    authorize @application
    if params[:application][:decision] == 'update'
      if @application.save
        flash[:notice] =  t('.successfully_updated')
      else
        flash[:alert] = t('.not_created')
      end
    elsif params[:decision] == 'accept'
      @application.accept!
      flash[:notice] = t('.accepted')
    elsif params[:decision] == 'reject'
      @application.reject!
      flash[:notice] = t('.rejected')
    else
      flash[:alert] = t('.cant_change_state')
    end
    redirect_to applications_path
  end

  def bulk_action
    # You can access bulk_action_params[:application_ids] here
    # You also need to add this action to config/routes.rb
    @application = policy_scope(Application).find(params[:selections].split(','))
    @application.each do |app|
      authorize app
      if params[:decision] == 'accept'
        app.accept!
        flash[:notice] = t('.accepted')
      elsif params[:decision] == 'reject'
        app.reject!
        flash[:notice] = t('.rejected')
      else
        flash[:alert] = t('.cant_change_state')
      end
    end
    redirect_to applications_path
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
    flash[:alert] = t('.user_not_authorized')
    redirect_to @application
  end
end
