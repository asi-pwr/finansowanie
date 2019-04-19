require 'rails_helper'

feature "Interacting with applications" , type: :system do
  background :all do
    organization = create(:organization)
    @user = create(:user, email: "example@example.com", password: "password")
    @user.organizations << organization
  end

  def login
    visit new_user_session_path
    page.save_screenshot('log_in_empty.png')
    fill_in 'user_email', with: "example@example.com"
    fill_in 'user_password', with: "password"
    click_button "sign_in"
    page.save_screenshot('log_in_filled.png')
  end

  
  scenario "Creating an application" do
    login
    visit new_application_path
    select "Organization 1", from: "application_organization_id"
    fill_in "application_name", with: "Sample application"
    fill_in "application_coordinator", with: "Good Man"
    page.save_screenshot('screen.png')
  end
  scenario "empty" do
    login
    expect(User.all.length).to eq(1)
  end
end
