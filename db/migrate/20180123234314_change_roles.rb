# frozen_string_literal: true

class ChangeRoles < ActiveRecord::Migration[5.1]
  def up
    change_table :roles do |t|
      t.remove :name
      t.string :member_role, :first_name, :last_name
    end
  end

  def down
    change_table :roles do |t|
      t.column :name, :string
      t.remove :member_role, :first_name, :last_name
    end
  end
end
