require 'rails_helper'

describe Review do
  it { should belong_to(:company) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:content) }
end