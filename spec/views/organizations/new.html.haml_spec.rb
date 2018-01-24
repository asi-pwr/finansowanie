require 'rails_helper'

RSpec.describe "organizations/new", type: :view do
  before(:each) do
    assign(:organization, Organization.new(
      :name => "MyText",
      :time_of_establishment => 1,
      :faculty_id => 1
    ))
  end

  it "renders new organization form" do
    render

    assert_select "form[action=?][method=?]", organizations_path, "post" do

      assert_select "textarea[name=?]", "organization[name]"

      assert_select "input[name=?]", "organization[time_of_establishment]"

      assert_select "input[name=?]", "organization[faculty_id]"
    end
  end
end
