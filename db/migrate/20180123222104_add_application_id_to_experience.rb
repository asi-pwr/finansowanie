# frozen_string_literal: true

class AddApplicationIdToExperience < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :application_id, :bigint
  end
end
