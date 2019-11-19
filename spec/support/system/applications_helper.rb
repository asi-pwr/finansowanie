# frozen_string_literal: true

def login
  visit new_user_session_path
  page.save_screenshot('log_in_empty.png')
  fill_in 'user_email', with: user_email
  fill_in 'user_password', with: user_password
  page.save_screenshot('log_in_filled.png')
  click_button "sign_in"
  page.save_screenshot('log_in_clicked.png')
end

def fill_in_application_form(organization_name: nil)
  visit new_application_path
  page.save_screenshot('empty_application.png')
  select organization_name, from: "application_organization_id"
  fill_in "application_name", with: "Sample application"
  fill_in "application_coordinator", with: "Smoug Ornstein"

  fill_in 'application_amount_applied_for', with: '20'
  fill_in 'application_amount_other_sources', with: '10'

  fill_in 'application_description', with: "Sample description\nFor an application"
  fill_in 'application_location', with: 'Wroclaw'

  fill_in 'application_project_subject', with: 'Very important subject'
  fill_in 'application_required_resources', with: 'Big hammer and a spear'
  fill_in 'application_past_schedule', with: 'No concern'
  fill_in 'application_past_schedule', with: 'Lord Gwyn'
  fill_in 'application_target_group', with: 'The player'
  fill_in 'application_sponsor_enlistment', with: 'Decent strategy'
  fill_in 'application_promotion_plans', with: 'Big plans'

  # remove all fields
  all('button.remove_row').each(&:click)
  # and add one each
  find('#add_experience').click
  find('#add_schedule_item').click
  find('#add_member').click

  fill_in with: "Project name 1", id: /.*experiences.*project_name/
  fill_in with: "Important role", id: /.*experiences.*role/
  fill_in with: "1337", id: /.*experiences.*budget/
  fill_in with: "Original Name", id: /.*experiences.*member_name/

  fill_in with: "Important position", id: /.*schedule_items.*todo/

  fill_in "application_current_state", with: "Very advanced, much activity"

  fill_in with: "Important_role", id: /.*role.*member_role/
  fill_in with: "Ornstein", id: /.*role.*first_name/
  fill_in with: "Smough", id: /.*role.*last_name/

  attach_file 'application_files', [file_path_to('ugandan_knuckles.png'), file_path_to('lorem_ipsum.txt')]
end
