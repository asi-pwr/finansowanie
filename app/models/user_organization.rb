class UserOrganization < ApplicationRecord
  has_one :user
  has_one :organization
end
