# frozen_string_literal: true

class TotalSumValidator < ActiveModel::Validator
  def validate(record)
    sum = record.amount_applied_for.to_i + record.amount_other_sources.to_i
    record.errors.add(:amount_overall, 'is not a sum of amounts applied for') if record.amount_overall.to_i != sum
    record.errors.add(:amount_overall, 'must not be equal to 0') if record.amount_overall.to_i == 0

  end
end
