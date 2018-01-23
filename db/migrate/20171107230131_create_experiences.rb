class CreateExperiences < ActiveRecord::Migration[5.1]
  def change
    create_table :experiences do |t|
      t.string :project_name
      t.string :role
      t.date :project_date
      t.integer :budget
      t.references :user, foreign_key: true
    end
  end
end
