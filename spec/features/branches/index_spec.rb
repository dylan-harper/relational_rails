require 'rails_helper'

RSpec.describe 'branches index' do

  it 'can display all branches' do
    bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)

    branch_1 = bank_1.branches.create!(name: 'Branch',
                              zip_code: 123456,
                              has_atm: true,
                              quarterly_rev: 1000000,
                              bank_id: 3)
    branch_2 = bank_1.branches.create!(name: 'Other Branch',
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000,
                              bank_id: 4)

    visit "/branches"

    expect(page).to have_content(branch_1.name)
    expect(page).to have_content(branch_2.name)
  end

  it 'has a link to the banks index' do
    visit "/branches"

    click_on "Banks Main"

    expect(current_path).to eq("/banks")
  end

end
