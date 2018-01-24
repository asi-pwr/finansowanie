# frozen_string_literal: true

class DropTableCoordinatorsProjects < ActiveRecord::Migration[5.1]
  def change
    drop_table :coordinators_projects
  end
end
