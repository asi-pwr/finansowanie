# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationPolicy do
  let(:user) { User.new }

  subject { described_class }

  permissions ".scope" do
    it "should return all applications for admin" do
      let(:admin) { User.new(admin: true) }
      pending "should include all applications"
    end
  end

  permissions :update? do
    pending "add some examples to (or delete) #{__FILE__}"
  end
end
