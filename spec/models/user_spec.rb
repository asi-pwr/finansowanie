# frozen_string_literal: true

require 'rails_helper'

#TODO more values
valid_emails = Array[ "email@domain.com",
  "firstname.lastname@domain.com"]
invalid_emails = Array["plainaddress",
  "#@%^%\#$@\#$@#.com"]
RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  valid_emails.each do |n|
    it { is_expected.to allow_value(n).for(:email) }
  end
  invalid_emails.each do |n|
    it { is_expected.not_to allow_value(n).for(:email) }
  end
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end
  it "should belong to 0 or more organizations" do
    expect(User.reflect_on_association(:organizations).macro).to eq(:has_many)
  end
  it "should belong to one or more faculties" do
    expect(User.reflect_on_association(:user_applications).macro).to eq(:has_many)
  end
  it "should validate phone number" do
  end
  # TODO test for more phone values
  it { is_expected.to allow_value("22332").for(:phone_number) }
  it { is_expected.not_to allow_value("223p233").for(:phone_number) }
  it { is_expected.to allow_value(nil).for(:phone_number) }
end
