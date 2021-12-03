require 'rails_helper'

RSpec.describe 'Banks branches index' do
  before :each do
    @bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    @branch_1 = @bank_1.branches.create!(name: "Branch",
                            zip_code: 123456,
                            has_atm: true,
                            quarterly_rev: 1000000)
    @branch_2 = @bank_1.branches.create!(name: "Other Branch",
                            zip_code: 654321,
                            has_atm: false,
                            quarterly_rev: 2000000)
  end

  it 'shows all of the branches for the bank' do


    visit "/banks/#{@bank_1.id}/branches"

    # expect(page).to have_content(bank_1.name)
    expect(page).to have_content(@branch_1.name)
    expect(page).to have_content(@branch_2.name)
  end

  it 'links to each branch show page' do
    visit "/banks/#{@bank_1.id}/branches"

    click_on @branch_1.name

    expect(current_path).to eq("/branches/#{@branch_1.id}")
  end


end