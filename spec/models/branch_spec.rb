require 'rails_helper'

RSpec.describe Branch do
  it {should belong_to :bank}

  before :each do
    @bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)

    @branch_1 = @bank_1.branches.create!(name: 'Branch',
                              zip_code: 123456,
                              has_atm: true,
                              quarterly_rev: 1000000,
                              bank_id: 3)
    @branch_2 = @bank_1.branches.create!(name: 'Other Branch',
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000,
                              bank_id: 4)
    @branch_3 = @bank_1.branches.create!(name: 'Other, other Branch',
                              zip_code: 654321,
                              has_atm: true,
                              quarterly_rev: 2000000,
                              bank_id: 4)
  end

  it '#display_true' do


    expect(Branch.display_true).to eq([@branch_1, @branch_3])
    expect(Branch.display_true).to_not include(@branch_2)
  end

  it '::revenue_threshold' do
    test = Branch.revenue_threshold(1500000)

    expect(test).to eq([@branch_2, @branch_3])
  end
end
