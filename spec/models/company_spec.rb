require 'rails_helper'

describe Company do
  it { should belong_to(:category) }
  it { should validate_uniqueness_of(:name)}
  it { should validate_presence_of(:name)}

  describe "#recent_companies" do
    it "returns the companies in the reverse chronical order by created_at" do
      cafe = Fabricate(:company, created_at: 1.day.ago)
      pub = Fabricate(:company)
      expect(Company.recent_companies).to eq([pub, cafe])
    end
    it "returns all the companies if there are less than 5 companies" do
      cafe = Fabricate(:company, created_at: 1.day.ago)
      pub = Fabricate(:company)
      expect(Company.recent_companies.count).to eq(2)
    end
    it "returns 5 companies if there are more then 5 companies" do
      6.times { Fabricate(:company) }
      expect(Company.recent_companies.count).to eq(5)
    end
    it "returns the most recent 5 companies" do
      5.times { Fabricate(:company) }
      cafe = Fabricate(:company, created_at: 1.day.ago)
      expect(Company.recent_companies).not_to include(cafe)
    end
    it "returns an empty array if there's no companies" do
      expect(Company.recent_companies).to eq([])
    end
  end

  describe "#category_name" do
    it "returns the associated category name" do
      category = Fabricate(:category, name: "Restaurants")
      pizza = Fabricate(:company, category: category)
      expect(pizza.category_name).to eq("Restaurants")
    end
  end
end