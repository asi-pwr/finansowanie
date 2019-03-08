# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  # tests for build in validators
  it { is_expected.to validate_presence_of(:member_role) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  #tests for associations
  it { is_expected.to belong_to(:application) }

  # tests for factory
  it "has a valid factory" do
    expect(FactoryBot.build(:role)).to be_valid
  end
end
