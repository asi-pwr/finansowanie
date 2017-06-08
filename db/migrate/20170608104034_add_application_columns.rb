class ExtendsApplicationColumns < ActiveRecord::Migration[5.1]
  def change
    add_column :applications do |t|
      t.integer :amount_applied_for
      t.integer :amount_other_sources
      t.integer :amount_overall
      t.text :project_subject
      t.text :planned_date_and_location
      t.text :description_and_purpose
      t.text :required_resources
      t.text :list_of_previous_occurrences
      t.text :other_subjects_collaboraiton
      t.text :targets
      t.text :strategy_of_getting_sponsors
      t.text :planned_advertisement
      t.text :current_state
    end
  end
end
