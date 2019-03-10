# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserOrganization, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user_organization)).to be_valid
  end
end
