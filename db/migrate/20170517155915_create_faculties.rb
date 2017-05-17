class CreateFaculties < ActiveRecord::Migration[5.1]
  def change
    create_table :faculties do |t|
      t.string :name, null: false, default: ""

      t.timestamps
    end
  end
end
