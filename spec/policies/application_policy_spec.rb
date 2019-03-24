# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ApplicationPolicy do
  before(:all) {
    organization1 = create(:organization)
    organization2 = create(:organization)
    create_list(:application, 2,  organization: organization1)
    create_list(:application, 2,  organization: organization2)
  }
  subject(:described_class) { ApplicationPolicy.new(user, application) }

  permissions ".scope" do
    context "for admins" do
      let(:admin) { build(:user, admin: true, organizations: [Organization.first]) }
      let(:admin_scope) { ApplicationPolicy::Scope.new(admin, Application.all).resolve }

      # if user is an admin, his scope should resolve to all aplications
      # regardless of what organization he belongs to
      it "should resolve to all applications" do
        Application.all.each do |app|
          expect(admin_scope).to include(app)
        end
      end
    end
    context "for non admin users" do
      let(:user) { build(:user, organizations: [Organization.first]) }
      let(:user_scope) { ApplicationPolicy::Scope.new(user, Application.all).resolve }
      it "should resolve to user's organizations' applications" do
        # check every application of user's organization
        # user's scope should resolve to every application of
        # every organization he belongs to
        user.organizations.each do |user_org|
          Application.where(organization_id: user_org.id).each do |app|
            expect(user_scope).to include(app)
          end
        end
      end
      it "should not resolve to applications that do not belong to user's organizations" do
        # check every application of every organization
        # if user does not belong to an organization
        # his scope should not include it's applications
        Organization.all.each do |org|
          Application.where(organization_id: org.id).each do |app|
            if !user.organizations.include? org
              expect(user_scope).not_to include(app)
            end
          end
        end
      end
    end
  end

  # only admins should be allowed to update
  permissions :update? do
    context "for admin user" do
      let(:user) { build(:user, admin: true, organizations: [Organization.first]) }
      let(:application) { Application.find_by(organization_id: Organization.first) }

      it "should be allowed" do
        expect(described_class).to permit_action(:update)
      end
    end

    context "for non admin user" do
      let(:user) { build(:user, organizations: [Organization.first]) }
      let(:application) { Application.find_by(organization_id: Organization.first) }

      it "should be forbidden" do
        expect(described_class).to forbid_action(:update)
      end
    end
  end
end
