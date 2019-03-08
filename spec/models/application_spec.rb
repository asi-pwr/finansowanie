# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Application, type: :model do
  let!(:organization) { build :organization }

  # testing sum validator
  it "incorrect sum should get false" do
    application = build(:application, amount_applied_for: 1, amount_other_sources: 1, amount_overall: 3)
    expect(application.valid?).to eq(false)
  end

  it "correct sum should get true" do
    application = build(:application)
    expect(application.valid?).to eq(true)
  end

  # tests for built in validators
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_presence_of(:coordinator) }
  it { is_expected.to validate_presence_of(:amount_applied_for) }
  it { is_expected.to validate_numericality_of(:amount_applied_for).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:amount_other_sources) }
  it { is_expected.to validate_numericality_of(:amount_other_sources).is_greater_than_or_equal_to(0) }

  it { is_expected.to validate_presence_of(:amount_overall) }
  it { is_expected.to validate_numericality_of(:amount_overall).is_greater_than_or_equal_to(1) }

  # tests for date
  context "when application date is before or on current date" do
    it { should allow_value(1.day.ago).for(:date) }
    it { should allow_value(Time.zone.today).for(:date) }
  end

  context "when application date is after current date" do
    it { should_not allow_value(1.day.from_now).for(:date) }
  end

  # tests for factory validity
  it "has a valid factory" do
    expect(FactoryBot.build(:application)).to be_valid
  end

  # tests for associations
  it "should belong to organization" do
    is_expected.to belong_to :organization
  end 

  it "should have many roles" do
    is_expected.to have_many :roles
  end
  it "should have many experiences" do
    is_expected.to have_many :experiences 
  end
  it "should have many users" do
    is_expected.to have_many :users 
  end
  it "should have many schedule items" do
    is_expected.to have_many :schedule_items 
  end

  # tests for nested attributes
  it "should accept nested attributes for roles" do
    is_expected.to accept_nested_attributes_for(:roles)
  end
  it "should accept nested attributes for experiences" do
    is_expected.to accept_nested_attributes_for(:experiences)
  end
  it "should accept nested attributes for schedule items" do
    is_expected.to accept_nested_attributes_for(:schedule_items)
  end
  it "should accept nested attributes for roles" do
    is_expected.to accept_nested_attributes_for(:users)
  end
  
  # tests for aasm - changing states
  it "should start as pending" do
    application = build(:application)
    expect(application.pending?).to eq(true)
  end
  
  it { is_expected.to have_state(:pending) }
  it { is_expected.not_to allow_transition_to(:pending) }
  it { is_expected.to transition_from(:pending).to(:accepted).on_event(:accept) }
  it { is_expected.to transition_from(:pending).to(:rejected).on_event(:reject) }
  it { is_expected.to transition_from(:accepted).to(:rejected).on_event(:reject) }
  it { is_expected.to transition_from(:rejected).to(:accepted).on_event(:accept) }
  it { is_expected.to allow_event(:accept) }
  it { is_expected.to allow_event(:reject) }
  
  
end
