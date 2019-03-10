# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Faculty, type: :model do
  # tests for build in validators
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }

  # tests for associations
  it { is_expected.to have_many(:organizations) }
  it { is_expected.to have_many(:users) }

  # tests for factory
  it "has a valid factory" do
    expect(FactoryBot.build(:faculty)).to be_valid
  end
end
