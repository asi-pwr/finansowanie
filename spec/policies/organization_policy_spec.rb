# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganizationPolicy, type: :policy do
  subject { described_class }

  let!(:faculty) { FactoryBot.create(:faculty) }
  let!(:organizations) do
    4.times do
      FactoryBot.create(:organization)
    end
  end

  context "user is admin" do
    let(:user) {
      FactoryBot.build(:user, admin: true,
                              organizations: [Organization.first])
    }
    let(:scope) { OrganizationPolicy::Scope.new(user, Organization.all).resolve }

    it "user should be an admin" do
      expect(user.admin?).to be true
    end

    it "user should be in one organization" do
      expect(user.organizations.size).to eq 1
    end

    permissions ".scope" do
      it "should resolve to all organizations" do
        Organization.all.each do |org|
          expect(scope).to include org
        end
      end
    end
  end

  context "user is not an admin" do
    let(:user) {
      FactoryBot.build(:user,
                       organizations: [Organization.first,
                                       Organization.second])
    }
    it "user should not be an admin" do
      expect(user.admin?).to be_falsey
    end

    permissions ".scope" do
      let(:scope) { OrganizationPolicy::Scope.new(user, Organization.all).resolve }
      it "should resolve to user's organizations" do
        user_orgs = user.organizations
        user_orgs.each do |org|
          expect(scope).to include org
        end
      end

      it "should not resolve to organizations other than users'" do
        user_orgs = user.organizations
        Organization.all.each do |org|
          if !user_orgs.include? org do
            expect(scope).not_to include org
          end
          end
        end
      end
    end
  end
end
