class CoordinatorsProjectController < ApplicationController
  def create
    @coordinators_project = CoordinatorsProject.new
    @coordinators_project.save
  end
end
