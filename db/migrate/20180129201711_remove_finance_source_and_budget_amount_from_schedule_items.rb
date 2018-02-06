# frozen_string_literal: true

class RemoveFinanceSourceAndBudgetAmountFromScheduleItems < ActiveRecord::Migration[5.1]
  def up
    change_table :schedule_items do |t|
      t.remove :finance_source, :budget_amount
    end
  end

  def down
    change_table :schedule_items do |t|
      t.string :finance_source
      t.integer :budget_amount
    end
  end
end
