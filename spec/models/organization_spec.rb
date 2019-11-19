# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  # tests for built in validators
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:time_of_establishment) }

  # tests for associations
  it { is_expected.to belong_to(:faculty) }

  it { is_expected.to have_many(:users) }
  it { is_expected.to have_many(:applications) }

  # tests for date
  context "when founding date is before or on current date" do
    it { is_expected.to allow_value(Time.zone.today).for(:time_of_establishment) }
    it { is_expected.to allow_value(1.day.ago).for(:time_of_establishment) }
  end

  context "when founding date after current date" do
    it { is_expected.not_to allow_value(1.day.from_now).for(:time_of_establishment) }
  end

  # tests for factory
  it "has a valid factory" do
    expect(FactoryBot.build(:organization)).to be_valid
  end
end
