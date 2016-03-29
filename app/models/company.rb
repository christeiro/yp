class Company < ActiveRecord::Base
  belongs_to :category
  has_many :reviews, -> { order "created_at DESC"}
  validates_uniqueness_of(:name)
  validates_presence_of(:name)

  def self.recent_companies
    order("created_at DESC").first(5)
  end

  def category_name
    category.name
  end

  def full_address
    zip_address = [self.city, self.zipcode].select(&:present?).join(' ')
    [self.address, zip_address].select(&:present?).join(', ')
  end
end