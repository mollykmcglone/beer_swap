require 'rails_helper'

describe Profile do
  it { should belong_to :user }
end
