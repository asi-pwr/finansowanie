# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Faculty, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  it "has a valid factory" do
    expect(FactoryBot.build(:faculty)).to be_valid
  end
end
