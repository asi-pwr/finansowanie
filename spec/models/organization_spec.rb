# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Organization, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it { is_expected.to validate_presence_of(:time_of_establishment) }

  context "when founding date is before or on current date" do
    it { should allow_value(Date.today).for(:time_of_establishment) }
    it { should allow_value(1.day.ago).for(:time_of_establishment) }
  end 

  context "when founding date after current date" do
    it { should_not allow_value(1.day.from_now).for(:time_of_establishment) }
  end 

  it "has a valid factory" do
    expect(FactoryBot.build(:organization)).to be_valid
  end

end
