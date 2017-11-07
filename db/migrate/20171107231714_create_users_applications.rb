class CreateUsersApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :users_applications do |t|
      t.references :user, foreign_key: true
      t.references :application, foreign_key: true
      t.references :role, foreign_key: true
    end
  end
end
