# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrganizationPolicy, type: :policy do
  # Class under test
  let(:subject) { described_class.new(user, Organization.first) }

  let!(:faculty) { FactoryBot.create(:faculty) }
  before(:all) { create_list(:organization, 4) }
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

    it "should permit all actions to admins" do
      expect(subject).to permit_actions(%i[index update show edit create destroy])
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
          if !user_orgs.include? org
            expect(scope).not_to include org
          end
        end
      end
    end

    it "should not allow any actions to a non admin" do
      expect(subject).to forbid_actions(%i[index update show edit create destroy])
    end
  end
end
