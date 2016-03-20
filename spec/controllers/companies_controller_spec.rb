require 'rails_helper'

describe CompaniesController do
  describe "#GET :index" do
    it "sets @comapnies variable" do
      company = Fabricate(:company)
      get :index
      expect(assigns(:companies)).to eq([company])
    end
  end

  describe "#GET :show" do
    it "sets @company variable" do
      company = Fabricate(:company)
      get :show, id: company.id
      expect(assigns(:company)).to eq(company)
    end
  end
end