class CreateUsersOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :users_organizations, id: false do |t|
      t.belongs_to :user, index: true
      t.belongs_to :organization, index: true
    end
  end
end
