# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :project_name
      t.string :role
      t.date :project_date
      t.integer :budget
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
