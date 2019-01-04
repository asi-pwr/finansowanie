# frozen_string_literal: true

class AddAasmStateToApplications < ActiveRecord::Migration[5.2]
  def change
    add_column :applications, :aasm_state, :string
  end
end
