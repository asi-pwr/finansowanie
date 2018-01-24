# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "faculties/edit", type: :view do
  before(:each) do
    @faculty = assign(:faculty, Faculty.create!)
  end

  it "renders the edit faculty form" do
    render

    assert_select "form[action=?][method=?]", faculty_path(@faculty), "post" do
    end
  end
end
