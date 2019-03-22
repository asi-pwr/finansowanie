# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Organizations", type: :request do
  # sign_in helper specifically for integration tests
  include Devise::Test::IntegrationHelpers
  let!(:user) { create(:user) }
  describe "GET /organizations" do
    # if user is not an admin, he/she should be
    # redirected with response code 302
    it "expect to respond with redirect code if not admin" do
      user.update(admin: false)
      sign_in user
      get organizations_path
      expect(response).to have_http_status(302)
    end
    # if user is an admin, he/she should get 
    # page with "OK response code"
    it "expect to respond with ok code if admin" do
      user.update(admin: true)
      sign_in user
      get organizations_path
      expect(response).to have_http_status(200)
    end
  end
end
