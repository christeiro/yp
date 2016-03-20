class User < ActiveRecord::Base
  validates_presence_of(:email)
  validates_presence_of(:first_name)
  validates_presence_of(:last_name)
  validates_presence_of(:password)
  validates_uniqueness_of(:email)
  has_secure_password validation: false
end