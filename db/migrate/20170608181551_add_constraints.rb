class AddConstraints < ActiveRecord::Migration[5.1]
  def change
    change_table :coordinators_projects do |t|
      t.change :name, :string, null: false, default: ""
      t.change :function, :string, null: false, default: ""
      t.change :date, :date, null: false
      t.change :budget, :integer, null: false, default: 0
    end
    change_table :schedule_items do |t|
      t.change :todo, :string, null: false, default: ""
      t.change :start_date, :date, null: false
      t.change :due_date, :date, null: false
      t.change :finance_source, :string, null: false, default: ""
      t.change :budget_amount, :integer, null: false, default: 0
    end
    change_table :project_members do |t|
      t.change :function, :string, null: false, default: ""
      t.change :first_name, :string, null: false, default: ""
      t.change :last_name, :string, null: false, default: ""
    end
    change_table :organizations do |t|
      t.change :name, :string, null: false, default: ""
      t.change :time_of_establishment, :date, null: false
    end
    change_table :applications do |t|
      t.change :name, :string, null: false, default: ""
      t.change :coordinator, :string, null: false, default: ""
    end
  end
end
