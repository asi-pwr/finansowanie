# frozen_string_literal: true

class AddConstraints < ActiveRecord::Migration[5.1]
  def change
    %i(name function budget).each do |column|
      change_column_null :coordinators_projects, column, false
      change_column_default :coordinators_projects, column, from: nil, to: ""
    end
    change_column_null :coordinators_projects, :date, false

    %i(todo start_date due_date finance_source budget_amount).each do |column|
      change_column_null :schedule_items, column, false
      change_column_default :schedule_items, column, from: nil, to: ""
    end
    change_column_null :schedule_items, :start_date, false
    change_column_null :schedule_items, :due_date, false

    %i(function first_name last_name).each do |column|
      change_column_null :project_members, column, false
      change_column_default :project_members, column, from: nil, to: ""
    end

    %i(name).each do |column|
      change_column_null :organizations, column, false
      change_column_default :organizations, column, from: nil, to: ""
    end
    change_column_null :organizations, :time_of_establishment, null: false

    %i(name coordinator).each do |column|
      change_column_null :applications, column, false
      change_column_default :applications, column, from: nil, to: ""
    end
  end
end
