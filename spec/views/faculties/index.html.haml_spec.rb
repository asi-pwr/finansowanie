require 'rails_helper'

RSpec.describe "faculties/index", type: :view do
  before(:each) do
    assign(:faculties, [
      Faculty.create!(),
      Faculty.create!()
    ])
  end

  it "renders a list of faculties" do
    render
  end
end
