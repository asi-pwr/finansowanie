# frozen_string_literal: true

require "rails_helper"

describe "Homepage" do
  it "shows title" do
    visit root_url
    expect(page).to have_content("Finansowanie")
  end
end
