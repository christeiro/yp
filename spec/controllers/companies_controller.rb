require 'rails_helper'

describe CompaniesController do
  describe "#GET Index" do
    it "sets @comapnies variable" do
      company = Fabricate(:company)
      get :index
      expect(assigns(:companies)).to eq([company])
    end
  end
end