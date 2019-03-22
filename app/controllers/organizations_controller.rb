# frozen_string_literal: true

class OrganizationsController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError do |exception|
    flash[:alert] = "You are not authorized to perform this action"
    redirect_to request.referrer || root_path
  end
  before_action :set_organization, only: %i[show edit update destroy]
  after_action :verify_authorized

  # GET /organizations
  # GET /organizations.json
  def index
    @organizations = policy_scope(Organization)
    authorize Organization
  end

  # GET /organizations/1
  # GET /organizations/1.json
  def show
    @organization = policy_scope(Organization).find(params[:id])
    authorize @organization
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
    authorize @organization
  end

  # GET /organizations/1/edit
  def edit
    @organization = policy_scope(Organization).find(params[:id])
    authorize @organization
  end

  # POST /organizations
  # POST /organizations.json
  def create
    @organization = Organization.new(organization_params)
    authorize @organization
    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: t('.successfully_created') }
        format.json { render :show, status: :created, location: @organization }
      else
        format.html { render :new }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organizations/1
  # PATCH/PUT /organizations/1.json
  def update
    authorize @organization
    respond_to do |format|
      if @organization.update(organization_params)
        format.html { redirect_to @organization, notice: t('.successfully_updated') }
        format.json { render :show, status: :ok, location: @organization }
      else
        format.html { render :edit }
        format.json { render json: @organization.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organizations/1
  # DELETE /organizations/1.json
  def destroy
    authorize @organization
    @organization.destroy
    respond_to do |format|
      format.html { redirect_to organizations_url, notice: t('.successfully_destroyed') }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_organization
    @organization = Organization.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def organization_params
    params.require(:organization).permit(:name, :time_of_establishment, :faculty_id)
  end
end
