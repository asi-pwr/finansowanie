class CreateScheduleItems < ActiveRecord::Migration[5.1]
  def change
    create_table :schedule_items do |t|
      t.string :todo
      t.date :start_date
      t.date :due_date
      t.string :finance_source
      t.integer :budget_amount
      t.references :application, foreign_key: true

      t.timestamps
    end
  end
end
