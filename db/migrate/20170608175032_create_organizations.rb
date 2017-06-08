class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.date :time_of_establishment
      t.references :faculty, foreign_key: true

      t.timestamps
    end
  end
end
