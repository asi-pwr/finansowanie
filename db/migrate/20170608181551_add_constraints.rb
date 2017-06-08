class AddConstraints < ActiveRecord::Migration[5.1]
  def change
    change_table :coordinators_projects do |t|
      t.string :name, null: false, default: ""
      t.string :function, null: false, default: ""
      t.date :date, null: false
      t.integer :budget, null: false, default: 0
    end
    change_table :schedule_items do |t|
      t.string :todo, null: false, default: ""
      t.date :start_date, null: false
      t.date :due_date, null: false
      t.string :finance_source, null: false, default: ""
      t.integer :budget_amount, null: false, default: 0
    end
    change_table :project_members do |t|
      t.string :function, null: false, default: ""
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
    end
    change_table :organizations do |t|
      t.string :name, null: false, default: ""
      t.date :time_of_establishment, null: false
    end
    change_table :applications do |t|
      t.string :name, null: false, default: ""
      t.string :coordinator, null: false, default: ""
    end
  end
end
