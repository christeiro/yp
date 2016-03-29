require 'rails_helper'

describe Company do
  it { should belong_to(:category) }
  it { should validate_uniqueness_of(:name)}
  it { should validate_presence_of(:name)}
  it { should have_many(:reviews).order("created_at DESC") }

  describe "#recent_companies" do
    it "returns the companies in the reverse chronical order by created_at" do
      cafe = Fabricate(:company, created_at: 1.day.ago)
      pub = Fabricate(:company)
      expect(Company.recent_companies).to eq([pub, cafe])
    end
    it "returns all the companies if there are less than 5 companies" do
      Fabricate(:company, created_at: 1.day.ago)
      Fabricate(:company)
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

  describe "#full_address" do
    it "returns the full address of the company" do
      company = Fabricate(:company, address: "32 Street name", city: "Los Angeles", zipcode: "123456")
      expect(company.full_address).to eq("32 Street name, Los Angeles 123456")
    end
    it "returns address and city" do
      company = Fabricate(:company, address: "32 Street name", city: "Los Angeles", zipcode: nil)
      expect(company.full_address).to eq("32 Street name, Los Angeles")
    end
    it "returns city and zipcode" do
      company = Fabricate(:company, address: nil, city: "Los Angeles", zipcode: "123456")
      expect(company.full_address).to eq("Los Angeles 123456")
    end
    it "returns address and zipcode" do
      company = Fabricate(:company, address: "32 Street Name", city: nil, zipcode: "123456")
      expect(company.full_address).to eq("32 Street Name, 123456")
    end
    it "returns empty string if no values exist" do
      company = Fabricate(:company, address: nil, city: nil, zipcode: nil)
      expect(company.full_address).to eq("")
    end
  end
end