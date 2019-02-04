# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  let!(:organization) { build :organization }

  # it { is_expected.to validate_presence_of(:name) }

  it "incorrect sum should get false" do
    application = build(:application,
                        organization: organization,
                        amount_applied_for: 1,
                        amount_other_sources: 1,
                        amount_overall: 3)
    expect(application.valid?).to eq(false)
  end

  it "correct sum should get true" do
    application = build(:application,
                        organization: organization,
                        amount_applied_for: 1,
                        amount_other_sources: 1,
                        amount_overall: 2)
    expect(application.valid?).to eq(true)
  end
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:coordinator) }
  it { is_expected.to validate_presence_of(:amount_applied_for) }
  it do
    should validate_numericality_of(:amount_applied_for).
      is_greater_than_or_equal_to(0)
  end
  it { is_expected.to validate_presence_of(:amount_overall) }
  it do
    should validate_numericality_of(:amount_applied_for).
      is_greater_than_or_equal_to(0)
  end
  it { is_expected.to validate_presence_of(:amount_other_sources) }
  it do
    should validate_numericality_of(:amount_applied_for).
      is_greater_than_or_equal_to(0)
  end
  
  it "has a valid factory" do
    expect(FactoryBot.build(:application)).to be_valid
  end

end
