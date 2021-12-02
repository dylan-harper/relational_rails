require 'rails_helper'

Rspec.describe Elevatorco, type: :model do
  it {should have_many :buildings}
  
  describe 'instance methods' do

  end
end
