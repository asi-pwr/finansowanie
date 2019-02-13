# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Role, type: :model do
  it { is_expected.to validate_presence_of(:member_role) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  it "has a valid factory" do
    expect(FactoryBot.build(:role)).to be_valid
  end
end
