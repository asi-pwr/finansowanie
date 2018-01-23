require 'rails_helper'

RSpec.describe ApplicationsController, type: :controller do

  it { should use_before_action(:authenticate_user!) }

  it do
    params = {
      application: {
                     name: 'ASI',
                     coordinator: 'Seba',
                     amount_applied_for: 21,
                     amount_other_sources: 37,
                     amount_overall: 58
                   }
             }
             should permit(:name, :coordinator, :amount_applied_for, :amount_other_sources, :amount_overall).
               for(:create, params: params).
               on(:application)
  end  

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

end
