# frozen_string_literal: true

class ChangeUsers < ActiveRecord::Migration[5.1]
  def up
    change_table :users, bulk: true do |t|
      t.remove :has_training
      t.references :faculty, foreign_key: true
      t.string :phone_number
    end
  end

  def down
    change_table :users, bulk: true do |t|
      t.boolean :has_training, null: false, default: false
      t.remove :phone_number
    end
    remove_foreign_key :users, :faculties
    remove_column :users, :faculty_id
  end
end
