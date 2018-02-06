# frozen_string_literal: true

class DropTableCoordinatorsProjects < ActiveRecord::Migration[5.1]
  def change
    drop_table :coordinators_projects do |t|
      t.string :name
      t.string :function
      t.date :date
      t.integer :budget
      t.references :application, foreign_key: true
      t.timestamps
    end
  end
end
