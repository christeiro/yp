require 'rails_helper'

describe User do
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:password) }
  it { should validate_uniqueness_of(:email) }
  it { should have_many(:reviews).order("created_at DESC") }

  describe "#full_name" do
    it "it returns the users first and last name" do
      user = Fabricate(:user)
      expect(user.full_name).to eq("#{user.first_name} #{user.last_name}")
    end
  end
end