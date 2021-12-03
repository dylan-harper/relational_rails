require 'rails_helper'

RSpec.describe Bank, type: :model do
  it {should have_many :branches}
end
