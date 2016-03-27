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
  describe "POST #create" do
    context "with valid input" do
      it "sets @session for the user" do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(session[:user_id]).to eq(user.id)
      end
      it "redirects to profile page" do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(response).to redirect_to user_path(user)
      end
      it "shows the notice" do
        user = Fabricate(:user)
        post :create, email: user.email, password: user.password
        expect(flash[:notice]).not_to be_blank
      end
    end
    context "with invalid input" do
      it "redirects to sign in path" do
        post :create, email: Faker::Internet.safe_email
        expect(response).to redirect_to sign_in_path
      end
      it "sets the error message" do
        post :create, email: Faker::Internet.safe_email
        expect(flash[:error]).to be_present
      end
    end
  end
  describe "GET #destroy" do
    it "redirects to root path" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(response).to redirect_to root_path
    end
    it "clears the session for the current user" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(session[:user_id]).to be_nil
    end
    it "sets the notice" do
      session[:user_id] = Fabricate(:user).id
      get :destroy
      expect(flash[:notice]).to be_present
    end
  end
end