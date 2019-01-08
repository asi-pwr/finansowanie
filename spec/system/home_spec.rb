require "rails_helper"

describe "Homepage" do
  before do
    driven_by :selenium_chrome_headless
  end

  it "shows title" do
    visit root_url
    expect(page).to have_content("Finansowanie")
  end
end
