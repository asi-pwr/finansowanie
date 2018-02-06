# frozen_string_literal: true

class UserOrganization < ApplicationRecord
  belongs_to :user, inverse_of: :user_organizations
  belongs_to :organization, inverse_of: :user_organizations
end
