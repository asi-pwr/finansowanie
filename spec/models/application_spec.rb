# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:coordinator) }
  it { is_expected.to validate_presence_of(:amount_applied_for)  }
  it do 
    should validate_numericality_of(:amount_applied_for).
    is_greater_than_or_equal_to(0)
  end
  it { is_expected.to validate_presence_of(:amount_overall)  }
  it do
    should validate_numericality_of(:amount_applied_for).
    is_greater_than_or_equal_to(0)
  end  
  it { is_expected.to validate_presence_of(:amount_other_sources)  }
  it do
    should validate_numericality_of(:amount_applied_for).
    is_greater_than_or_equal_to(0)
  end
end
