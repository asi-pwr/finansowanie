# frozen_string_literal: true

class ChangeRoles < ActiveRecord::Migration[5.1]
  def change
    change_table :roles do |t|
      t.remove :name
      t.string :member_role, :first_name, :last_name
    end
  end
end
