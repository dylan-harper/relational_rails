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
      @branch_2 = @bank_2.branches.create!(name: "Z",
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000)
      @branch_3 = @bank_2.branches.create!(name: "O",
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000)
      @branch_4 = @bank_2.branches.create!(name: "B",
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000)
    end

    it '#branches_count' do
      expect(@bank_1.branches_count).to eq(1)
      expect(@bank_2.branches_count).to eq(3)
      expect(@bank_3.branches_count).to eq(0)
    end

    it '#order_by_name' do
      expect(@bank_2.order_by_name).to eq([@branch_4, @branch_3, @branch_2])
    end

    it '::sort_by_created' do
      expect(Bank.sort_by_created).to eq([@bank_1, @bank_2, @bank_3])
    end


  end
end
