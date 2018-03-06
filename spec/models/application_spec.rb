# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  let!(:organization) { build :organization }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:coordinator) }
  it "eas" do
    application = build(:application,
                        organization: organization,
                        amount_applied_for: 1,
                        amount_other_sources: 1,
                        amount_overall: 3
      )
    expect(application.valid?).to eq(false)
  end
end
