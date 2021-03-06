# frozen_string_literal: true

class FacultiesController < ApplicationController
  include Pundit
  rescue_from Pundit::NotAuthorizedError do |_exception|
    flash[:alert] = t('.user_not_authorized')
    redirect_to request.referer || root_path
  end
  before_action :set_faculty, only: %i[show edit update destroy]
  after_action :verify_authorized

  # GET /faculties
  # GET /faculties.json
  def index
    @faculties = Faculty.all
    authorize Faculty
  end

  # GET /faculties/1
  # GET /faculties/1.json
  def show
    authorize Faculty
  end

  # GET /faculties/new
  def new
    @faculty = Faculty.new
    authorize @faculty
  end

  # GET /faculties/1/edit
  def edit
    authorize Faculty
  end

  # POST /faculties
  # POST /faculties.json
  def create
    @faculty = Faculty.new(faculty_params)
    authorize @faculty
    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, notice: t('.successfully_created') }
        format.json { render :show, status: :created, location: @faculty }
      else
        format.html { render :new }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /faculties/1
  # PATCH/PUT /faculties/1.json
  def update
    respond_to do |format|
      if @faculty.update(faculty_params)
        format.html { redirect_to @faculty, notice: t('.successfully_updated') }
        format.json { render :show, status: :ok, location: @faculty }
      else
        format.html { render :edit }
        format.json { render json: @faculty.errors, status: :unprocessable_entity }
      end
    end
    authorize @faculty
  end

  # DELETE /faculties/1
  # DELETE /faculties/1.json
  def destroy
    @faculty.destroy
    respond_to do |format|
      format.html { redirect_to faculties_url, notice: t('.successfully_destroyed') }
      format.json { head :no_content }
    end
    authorize @faculty
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_faculty
    @faculty = Faculty.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def faculty_params
    params.require(:faculty).permit(:name)
  end
end
