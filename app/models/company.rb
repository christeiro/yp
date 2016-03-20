class Company < ActiveRecord::Base
  belongs_to :category
  validates_uniqueness_of(:name)
  validates_presence_of(:name)
end