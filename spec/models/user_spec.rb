# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  #TODO more values
  valid_emails = %w(firstname.lastname@domain.com 
    firstname.lastname@domain.com	
    email@subdomain.domain.com	
    firstname+lastname@domain.com	
    email@123.123.123.123	
    email@[123.123.123.123]	
    "email"@domain.com	
    1234567890@domain.com	
    email@domain-one.com	
    _______@domain.com	
    email@domain.name	
    email@domain.co.jp	
    firstname-lastname@domain.com	
  ) 
  invalid_emails = %w(plainaddress
    #@%^%#$@#$@#.com	
    @domain.com	
    email@domain@domain.com
  )
  valid_phone_numbers = Array[]
  invalid_phone_numbers = Array[]
  
  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_presence_of(:full_name) }
  it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  
  valid_emails.each do |n|
    it { is_expected.to allow_value(n).for(:email) }
  end
  invalid_emails.each do |n|
    it { is_expected.not_to allow_value(n).for(:email) }
  end

  # tests for factory
  it "has a valid factory" do
    expect(FactoryBot.build(:user)).to be_valid
  end

  # tests for associations
  it { is_expected.to have_many :organizations }
  it { is_expected.to have_many :applications }

  # TODO test for more phone values
  it { is_expected.to allow_value("22332").for(:phone_number) }
  it { is_expected.not_to allow_value("223p233").for(:phone_number) }
  it { is_expected.to allow_value(nil).for(:phone_number) }
end
