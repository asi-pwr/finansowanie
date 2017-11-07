class CreateUsersOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :users_organizations do |t|
      t.references :user, foreign_key: true
      t.references :organization, foreign_key: true
    end
  end
end
