# frozen_string_literal: true

class RemoveUserIdFromExperiences < ActiveRecord::Migration[5.1]
  def up
    remove_index :experiences, :user_id
    remove_column :experiences, :user_id, :bigint
  end

  def down
    change_table :experiences do |t|
      t.bigint :user_id
      t.index :user_id
    end
  end
end
