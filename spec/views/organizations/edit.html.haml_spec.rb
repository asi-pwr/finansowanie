# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "organizations/edit", type: :view do
  before(:each) do
    @organization = assign(:organization, Organization.create!(
                                            name: "MyText",
                                            time_of_establishment: 1,
                                            faculty_id: 1
                                          ))
  end

  it "renders the edit organization form" do
    render

    assert_select "form[action=?][method=?]", organization_path(@organization), "post" do
      assert_select "textarea[name=?]", "organization[name]"

      assert_select "input[name=?]", "organization[time_of_establishment]"

      assert_select "input[name=?]", "organization[faculty_id]"
    end
  end
end
