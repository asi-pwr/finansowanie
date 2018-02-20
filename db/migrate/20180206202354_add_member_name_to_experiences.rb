# frozen_string_literal: true

class AddMemberNameToExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :experiences, :member_name, :string
  end
end
