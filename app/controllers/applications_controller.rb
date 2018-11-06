# frozen_string_literal: true

class ApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_application, only: %i[show edit update destroy]

  def index
    @applications = Application.all
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
    @application = @organization.applications.create(application_params)

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @application, notice: 'Application was successfully created.' }
        format.json { render :show, status: :created, location: @application }
      else
        format.html { render :new }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /applications/1
  # GET /applications/1.json

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @application.update(application_params)
        format.html { redirect_to @application, notice: 'Application was successfully updated.' }
        format.json { render :show, status: :ok, location: @application }
      else
        format.html { render :edit }
        format.json { render json: @application.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @application.destroy
    respond_to do |format|
      format.html { redirect_to applications_url, notice: 'Application was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_application
    @application = Application.find(params[:id])
  end

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
      roles_attributes: %i[member_role first_name last_name]
    )
  end
end
