require 'rails_helper'

RSpec.describe Bank, type: :model do
  it {should have_many :branches}

  describe 'instance methods' do
    before :each do
      @bank_1 = Bank.create!(name: 'Wells Fargo',
                            hq_city_state: 'San Francisco, California',
                            fdic_ins: true,
                            mobile_app: true,
                            size_by_assets: 1303558000)
      @bank_2 = Bank.create!(name: 'Chase',
                            hq_city_state: 'New York City, New York',
                            fdic_ins: true,
                            mobile_app: true,
                            size_by_assets: 3757576000)
      @bank_3 = Bank.create!(name: 'BoA',
                              hq_city_state: 'Charlotte, North Carolina',
                              fdic_ins: true,
                              mobile_app: true,
                              size_by_assets: 3000000000)
      @branch_1 = @bank_1.branches.create!(name: "Branch",
                              zip_code: 123456,
                              has_atm: true,
                              quarterly_rev: 1000000)
      @branch_2 = @bank_2.branches.create!(name: "Other Branch",
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000)
    end

    it '#branches_count' do
      expect(@bank_1.branches_count).to eq(1)
      expect(@bank_2.branches_count).to eq(1)
      expect(@bank_3.branches_count).to eq(0)
    end
  end
end
