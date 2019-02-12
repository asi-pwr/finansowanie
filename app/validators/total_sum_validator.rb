# frozen_string_literal: true

class TotalSumValidator < ActiveModel::Validator
  def validate(record)
    #sum = record.amount_applied_for + record.amount_other_sources
    #record.errors.add(:amount_overall, 'is not a sum of amounts applied for') if record.amount_overall != sum
    if !record.nil?
      record.errors.add :base, "nil record"
    end
  end
end
