# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ScheduleItem, type: :model do
  it { is_expected.to validate_presence_of(:todo) }

  it "has a valid factory" do
    expect(FactoryBot.build(:schedule_item)).to be_valid
  end

end
