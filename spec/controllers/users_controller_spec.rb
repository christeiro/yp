require 'rails_helper'

describe UsersController do
  describe "GET :new" do
    it "sets @user for unauthenticated user" do
      get :new
      expect(assigns(:user)).to be_new_record
    end
  end

  describe "POST :create" do
    context "with valid input"
    context "with invalid input"
  end
end