require 'rails_helper'

describe ReviewsController do
  describe "POST :create" do
    context "with authenticated user"
    context "with valid input" do
      it "redirects to the company show page" do
        user = Fabricate(:user)
        company = Fabricate(:company)
        session[:user_id] = user.id
        post :create, company_id: company.id, review: Fabricate.attributes_for(:review)
        expect(response).to redirect_to company
      end
      it "creates the review" do
        user = Fabricate(:user)
        company = Fabricate(:company)
        session[:user_id] = user.id
        post :create, company_id: company.id, review: Fabricate.attributes_for(:review)
        expect(Review.count).to eq(1)
      end
      it "associates the review with the company" do
        user = Fabricate(:user)
        company = Fabricate(:company)
        session[:user_id] = user.id
        post :create, company_id: company.id, review: Fabricate.attributes_for(:review)
        expect(company.reviews.count).to eq(1)
      end
      it "associates the review with the current user" do
        user = Fabricate(:user)
        company = Fabricate(:company)
        session[:user_id] = user.id
        post :create, company_id: company.id, review: Fabricate.attributes_for(:review), user_id: user.id
        expect(user.reviews.count).to eq(1)
      end
    end
    context "with invalid input" do
      it "renders the company template :show" do
        user = Fabricate(:user)
        company = Fabricate(:company)
        session[:user_id] = user.id
        post :create, company_id: company.id, review: Fabricate.attributes_for(:review, content: nil), user_id: user.id
        expect(response).to render_template "companies/show"
      end
      it "does not create the review" do
        user = Fabricate(:user)
        company = Fabricate(:company)
        session[:user_id] = user.id
        post :create, company_id: company.id, review: Fabricate.attributes_for(:review, content: nil), user_id: user.id
        expect(Review.count).to eq(0)
      end
    end
  end
  context "with unauthenticated user" do
    it "redirects to the sign in path" do
      company = Fabricate(:company)
      post :create, company_id: company.id, review: Fabricate.attributes_for(:review, content: nil)
      expect(response).to redirect_to sign_in_path
    end
  end
end