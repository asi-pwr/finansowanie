class ChangeColumnNameApplicationsOrganizationsIdToApplicationsOrganizationId < ActiveRecord::Migration[5.1]
  def change
    rename_column  :applications, :organizations_id, :organization_id
  end
end
