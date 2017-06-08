class CreateCoordinatorsProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :coordinators_projects do |t|
      t.string :name
      t.string :function
      t.date :date
      t.integer :budget
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
