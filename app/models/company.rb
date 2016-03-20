class Company < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of(:name)
  validates_presence_of(:name)

  def self.recent_companies
    order("created_at DESC").first(5)
  end

  def category_name
    category.name
  end
end