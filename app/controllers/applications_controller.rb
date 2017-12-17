class ApplicationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @application = Application.new
    @organizations = current_user.organizations
  end

  def create
  end
end
