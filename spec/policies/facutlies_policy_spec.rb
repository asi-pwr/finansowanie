# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FacultyPolicy, type: :policy do
  subject { described_class }
  let(:faculties) { create_list(:faculty, 4) }

  context "for admin user" do
    let(:user_faculty) { faculties.first }
    let(:user) { build(:user, faculty_id: user_faculty.id, admin: true) }

    permissions ".scope" do
      it "resolves to all faculties" do
        expect(described_class::Scope.new(user, Faculty).resolve).to include(faculties.first)
      end
    end

    it "permits all actions" do
      expect(described_class.new(user, user_faculty)).
        to permit_actions(%w(index show edit create update destroy))
    end
  end

  context "for normal user" do
    let(:user_faculty) { faculties.second }
    let(:user) { build(:user, faculty_id: user_faculty.id) }
    let(:resolved_scope) { described_class::Scope.new(user, Faculty).resolve }

    permissions ".scope" do
      it "resolves to user faculty" do
        expect(resolved_scope).to include(user_faculty)
      end
      it "does not resolve to any other faculty" do
        faculties.each do |fac|
          if fac.id != user_faculty.id
            expect(resolved_scope).not_to include(fac)
          end
        end
      end
    end

    it "forbids all actions" do
      expect(described_class.new(user, user_faculty)).
        to forbid_actions(%w(index show edit create update destroy))
    end
  end
end
