class Review < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  validates_presence_of :content
end