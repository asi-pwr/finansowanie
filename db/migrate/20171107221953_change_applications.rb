class ChangeApplications < ActiveRecord::Migration[5.1]
  def change
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
end
