require 'rails_helper'

RSpec.describe 'branch show' do

  it 'displays the attributes for branch_1' do
    @bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    @branch_1 = @bank_1.branches.create!(name: "Branch",
                            zip_code: 123456,
                            has_atm: true,
                            quarterly_rev: 1000000)

    visit "/branches/#{@branch_1.id}"

    expect(page).to have_content(@branch_1.name)
    expect(page).to have_content(@branch_1.zip_code)
    expect(page).to have_content(@branch_1.has_atm)
    expect(page).to have_content(@branch_1.quarterly_rev)
    expect(page).to have_content(@branch_1.bank_id)
    expect(page).to have_content(@branch_1.created_at)
    expect(page).to have_content(@branch_1.updated_at)
  end

  it 'displays the attributes for branch_2' do
    @bank_2 = Bank.create!(name: 'Chase',
                          hq_city_state: 'New York City, New York',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 3757576000)
    @branch_2 = @bank_2.branches.create!(name: "Other Branch",
                            zip_code: 654321,
                            has_atm: false,
                            quarterly_rev: 2000000)

    visit "/branches/#{@branch_2.id}"

    expect(page).to have_content(@branch_2.name)
    expect(page).to have_content(@branch_2.zip_code)
    expect(page).to have_content(@branch_2.has_atm)
    expect(page).to have_content(@branch_2.quarterly_rev)
    expect(page).to have_content(@branch_2.bank_id)
    expect(page).to have_content(@branch_2.created_at)
    expect(page).to have_content(@branch_2.updated_at)
  end

  it 'has a link to the branches index' do
    @bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    @branch_1 = @bank_1.branches.create!(name: "Branch",
                            zip_code: 123456,
                            has_atm: true,
                            quarterly_rev: 1000000)

    visit "/branches/#{@branch_1.id}"

    click_on "Branches Main"

    expect(current_path).to eq("/branches")
  end

  it 'has a link to the banks index' do
    bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    branch_1 = bank_1.branches.create!(name: "Branch",
                            zip_code: 123456,
                            has_atm: true,
                            quarterly_rev: 1000000)

    visit "/branches/#{branch_1.id}"

    click_on "Banks Main"

    expect(current_path).to eq("/banks")
  end

  it 'can delete the branch from the show page' do
    bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    branch_1 = bank_1.branches.create!(name: "Lake Street",
                            zip_code: 123456,
                            has_atm: true,
                            quarterly_rev: 1000000)

    visit "/branches/#{branch_1.id}"

    click_link "Delete #{branch_1.name}"

    expect(current_path).to eq("/branches")
    expect(page).to_not have_content(branch_1.name)
  end

end
