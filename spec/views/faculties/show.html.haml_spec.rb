# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "faculties/show", type: :view do
  before(:each) do
    @faculty = assign(:faculty, Faculty.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
