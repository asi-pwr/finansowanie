# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScheduleItem, type: :model do
  # tests for built in validators
  it { is_expected.to validate_presence_of(:todo) }
  it { is_expected.to validate_presence_of(:start_date) }
  it { is_expected.to validate_presence_of(:due_date) }

  # tests for associations
  it { is_expected.to belong_to(:application) }

  # tests for factory
  it "has a valid factory" do
    expect(FactoryBot.build(:schedule_item)).to be_valid
  end
end
