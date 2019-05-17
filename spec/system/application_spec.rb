# frozen_string_literal: true

require 'rails_helper'

feature "Interacting with applications", type: :system do
  def organization_name
    "Testowa organizacja"
  end

  def user_email
    "example@example.com"
  end

  def user_password
    "password"
  end

  def file_path_to(file_name)
    Rails.root + 'spec/factories/' + file_name
  end

  background :all do
    organization = create(:organization, name: organization_name)
    @user = create(:user, email: user_email, password: user_password)
    @user.organizations << organization
  end

  scenario "Creating an application" do
    login
    fill_in_application_form(organization_name: organization_name)
    page.save_screenshot('filled_application.png')
    click_button "submit_application"
    page.save_screenshot('system_spec_application_submitted_links.png')
    scroll_to page.find_by_id('attachments') # rubocop:disable Rails/DynamicFindBy
    expect(page).to have_text I18n.translate('applications.created_successfully')
    page.save_screenshot('system_spec_application_submitted_links.png')
  end
end
