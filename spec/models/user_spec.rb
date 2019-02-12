# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  it { is_expected.to have_secure_password }
  it {
    is_expected.to allow_value("example@example.com").for(:email)
    is_expected.not_to allow_value("example.com").for(:email)
  }
end
