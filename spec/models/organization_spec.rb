# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:time_of_establishment) }

  it "has a valid factory" do
    expect(FactoryBot.build(:organization)).to be_valid
  end

end
