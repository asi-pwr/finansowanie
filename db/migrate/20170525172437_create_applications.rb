# frozen_string_literal: true

class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :coordinator
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
