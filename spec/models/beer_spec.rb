require 'rails_helper'

RSpec.describe Beer, type: :model do
  it { should belong_to :profile }
  it { should belong_to :style }
  it { should validate_presence_of :name }
  it { should validate_presence_of :container_type }
  it { should validate_presence_of :brew_date }
  it { should validate_presence_of :description }
end
