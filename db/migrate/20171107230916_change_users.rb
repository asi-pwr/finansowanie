# frozen_string_literal: true

class ChangeUsers < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove :has_training
      t.references :faculty, foreign_key: true
      t.string :phone_number
    end
  end
end
