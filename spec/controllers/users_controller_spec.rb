require 'rails_helper'

describe UsersController do
  describe "GET :new" do
    it "sets @user for unauthenticated user" do
      get :new
      expect(assigns(:user)).to be_new_record
    end
  end

  describe "POST :create" do
    context "with valid input" do
      it "redirects to the sign in path" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(response).to redirect_to sign_in_path
      end
      it "creates the user account" do
        post :create, user: Fabricate.attributes_for(:user)
        expect(User.count).to eq(1)
      end
    end

    context "with invalid input" do
      it "does not create the user" do
        post :create, user: {first_name: Faker::Name.first_name }
        expect(User.count).to eq(0)
      end
      it "renders the template :new" do
        post :create, user: {first_name: Faker::Name.first_name }
        expect(response).to render_template :new
      end
      it "sets the @user" do
        post :create, user: {first_name: Faker::Name.first_name }
        expect(assigns(:user)).to be_instance_of(User)
      end
    end
  end
  describe "GET :show" do
    it "renders the template" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :show, id: user.id
      expect(response).to render_template :show
    end
    it "redirects to sign in path for unauthenticated user" do
      user = Fabricate(:user)
      get :show, id: user.id
      expect(response).to redirect_to sign_in_path
    end
    it "sets @user for authenticated user" do
      user = Fabricate(:user)
      session[:user_id] = user.id
      get :show, id: user.id
      expect(assigns(:user)).to eq(user)
    end
  end
end