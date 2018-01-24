# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "organizations/index", type: :view do
  before(:each) do
    assign(:organizations, [
             Organization.create!(
               name: "MyText",
               time_of_establishment: 2,
               faculty_id: 3
             ),
             Organization.create!(
               name: "MyText",
               time_of_establishment: 2,
               faculty_id: 3
             )
           ])
  end

  it "renders a list of organizations" do
    render
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
