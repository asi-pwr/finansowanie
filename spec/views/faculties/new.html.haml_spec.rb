# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "faculties/new", type: :view do
  before(:each) do
    assign(:faculty, Faculty.new)
  end

  it "renders new faculty form" do
    render

    assert_select "form[action=?][method=?]", faculties_path, "post" do
    end
  end
end
