require 'rails_helper'

RSpec.describe UserApplication, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:user_application)).to be_valid
  end
end
