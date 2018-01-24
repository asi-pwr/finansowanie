class AddOrganizationIdAsIndexToRolesAndExperiences < ActiveRecord::Migration[5.1]
  def change
    add_column :roles, :application_id, :bigint
    add_index :experiences, :application_id
    add_index :roles, :application_id
  end
end
