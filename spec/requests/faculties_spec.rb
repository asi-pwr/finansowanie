# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Faculties", type: :request do
  describe "GET /faculties" do
    it "works! (now write some real specs)" do
      get faculties_path
      expect(response).to have_http_status(200)
    end
  end
end