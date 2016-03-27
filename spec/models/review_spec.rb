require 'rails_helper'

describe Review do
  it { should belong_to(:company) }
  it { should belong_to(:user) }
end