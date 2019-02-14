# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Experience, type: :model do
  it { is_expected.to validate_presence_of(:project_name) }
  it { is_expected.to validate_presence_of(:role) }
  it { is_expected.to validate_presence_of(:project_date) }

  it { is_expected.to validate_presence_of(:budget) }
  it { is_expected.to validate_numericality_of(:budget).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:member_name) }

  it "has a valid factory" do
    expect(FactoryBot.build(:experience)).to be_valid
  end
end
