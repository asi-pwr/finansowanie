# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  let!(:organization) { build :organization }

  it "incorrect sum should get false" do
    application = build(:application,
                        organization: organization,
                        amount_applied_for: 1,
                        amount_other_sources: 1,
                        amount_overall: 3,
                        date: 1.day.ago )
    expect(application.valid?).to eq(false)
  end

  it "correct sum should get true" do
    application = build(:application,
                        organization: organization,
                        amount_applied_for: 1,
                        amount_other_sources: 1,
                        amount_overall: 2,
                        date: 1.day.ago )
    expect(application.valid?).to eq(true)
  end
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:coordinator) }
  it { is_expected.to validate_presence_of(:amount_applied_for) }
  it { is_expected.to validate_numericality_of(:amount_applied_for).is_greater_than_or_equal_to(0) }
 
  it { is_expected.to validate_presence_of(:amount_other_sources) }
  it { is_expected.to validate_numericality_of(:amount_other_sources).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:amount_overall) }
  it { is_expected.to validate_numericality_of(:amount_overall).is_greater_than_or_equal_to(1) }

  context "when application date is before or on current date" do
    it { should allow_value(1.day.ago).for(:date) }
    it { should allow_value(Date.today).for(:date) }
  end

  context "when application date is after current date" do
    it { should_not allow_value(1.day.from_now).for(:date)  }
  end

  it "has a valid factory" do
    expect(FactoryBot.build(:application)).to be_valid
  end

end
