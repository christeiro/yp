require 'rails_helper'

describe Company do
  it { should belong_to(:category) }
  it { should validate_uniqueness_of(:name)}
  it { should validate_presence_of(:name)}
end