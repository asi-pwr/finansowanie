class ApplicationsController < ApplicationController
  def new
    @application = Application.new
  end
  def create
    @application=Application.new(application_params)
    if @application.save
      redirect_to @application, notice: 'Wniosek został pomyślnie zapisany.'
    else
      render :new, notice: 'NIE DA SIE'
    end
    Rails.logger.info(@application.errors.inspect)
  end
  def index
    @applications = Application.all
  end
  private
  def application_params
    params.require(:application).permit(:name, :coordinator, :amount_applied_for, :amount_other_sources, :amount_overall,
    :project_subject, :planned_date_and_location, :description_and_purpose, :required_resources, :list_of_previous_occurrences,
    :other_subjects_collaboraiton, :targets, :strategy_of_getting_sponsors, :planned_advertisement, :current_state)
  end
end
