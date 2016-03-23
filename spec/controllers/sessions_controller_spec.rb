require 'rails_helper'

describe SessionsController do
  describe "GET #new" do
    it "renders the template" do
      get :new
      expect(response).to render_template :new
    end
    it "redirects to root path for authenticated users" do
      session[:user_id] = Fabricate(:user).id
      get :new
      expect(response).to redirect_to root_path
    end
  end
end