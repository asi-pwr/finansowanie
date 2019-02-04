# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:full_name) }

  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
end
