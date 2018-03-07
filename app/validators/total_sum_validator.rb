class TotalSumValidator < ActiveModel::Validator
  def validate(record)
    sum = record.amount_applied_for + record.amount_other_sources
    if record.amount_overall != sum
      record.errors.add(:amount_overall, 'is not a sum of amounts applied for')
    end
  end
end
