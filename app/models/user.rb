class User < ActiveRecord::Base
  validates_presence_of(:email)
  validates_presence_of(:first_name)
  validates_presence_of(:last_name)
  validates_presence_of(:password)
  validates_uniqueness_of(:email)
  has_many :reviews, -> { order "created_at DESC"}
  has_secure_password validation: false

  def full_name
    [first_name, last_name].join(' ')
  end
end