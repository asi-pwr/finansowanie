# frozen_string_literal: true

class ChangeApplications < ActiveRecord::Migration[5.1]
  def up
    change_table :applications do |t|
      t.references :organizations, foreign_key: true
      t.remove :planned_date_and_location
      t.text :location
      t.date :date
      t.rename :description_and_purpose, :description
      t.rename :list_of_previous_occurrences, :past_schedule
      t.rename :other_subjects_collaboraiton, :collaboration
      t.rename :targets, :target_group
      t.rename :strategy_of_getting_sponsors, :sponsor_enlistment
      t.rename :planned_advertisement, :promotion_plans
      t.text :estimate
    end
  end

  def down
    change_table :applications do |t|
      t.string :planned_date_and_location
      t.remove :location
      t.remove :date
      t.rename :description, :description_and_purpose
      t.rename :past_schedule, :list_of_previous_occurrences
      t.rename :collaboration, :other_subjects_collaboraiton
      t.rename :target_group, :targets
      t.rename :sponsor_enlistment, :strategy_of_getting_sponsors
      t.rename :promotion_plans, :planned_advertisement
      t.remove :estimate
    end
    remove_foreign_key :applications, :organizations
    remove_column :applications, :organizations_id
  end
end
