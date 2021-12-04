require 'rails_helper'

RSpec.describe 'bank show' do

  it 'displays the attributes for bank_1' do
    bank = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)

    visit "/banks/#{bank.id}"

    expect(page).to have_content(bank.name)
    expect(page).to have_content(bank.id)
    expect(page).to have_content(bank.hq_city_state)
    expect(page).to have_content(bank.fdic_ins)
    expect(page).to have_content(bank.mobile_app)
    expect(page).to have_content(bank.size_by_assets)
    expect(page).to have_content(bank.created_at)
    expect(page).to have_content(bank.updated_at)
  end

  it 'displays the attributes for bank_2' do
    bank = Bank.create!(name: 'Chase',
                          hq_city_state: 'New York City, New York',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 3757576000)

    visit "/banks/#{bank.id}"

    expect(page).to have_content(bank.name)
    expect(page).to have_content(bank.id)
    expect(page).to have_content(bank.hq_city_state)
    expect(page).to have_content(bank.fdic_ins)
    expect(page).to have_content(bank.mobile_app)
    expect(page).to have_content(bank.size_by_assets)
    expect(page).to have_content(bank.created_at)
    expect(page).to have_content(bank.updated_at)
  end

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

  it 'shows the count of children' do
    visit "/banks/#{@bank_1.id}"

    expect(page).to have_content('Number of Branches: 1')
    expect(page).to have_content(@bank_1.branches_count)
  end

  it 'has a link to the branches index' do
    visit "/banks/#{@bank_1.id}"

    click_on "Branches Main"

    expect(current_path).to eq("/branches")
  end

  it 'has a link to the banks index' do
    visit "/banks/#{@bank_1.id}"

    click_on "Banks Main"

    expect(current_path).to eq("/banks")
  end

  it 'has a link to all children' do
    visit "/banks/#{@bank_1.id}"

    click_on "see all"

    expect(current_path).to eq("/banks/#{@bank_1.id}/branches")
  end
end
