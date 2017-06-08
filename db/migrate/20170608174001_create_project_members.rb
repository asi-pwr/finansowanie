class CreateProjectMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :project_members do |t|
      t.string :function
      t.string :first_name
      t.string :last_name
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
