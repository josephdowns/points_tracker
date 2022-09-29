require 'rails_helper'

RSpec.describe UserPoint, type: :model do
  it { should validate_presence_of(:payer)}
  it { should validate_presence_of(:points)}
end
