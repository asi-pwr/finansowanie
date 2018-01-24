# frozen_string_literal: true

class DropTableProjectMembers < ActiveRecord::Migration[5.1]
  def change
    drop_table :project_members
  end
end
