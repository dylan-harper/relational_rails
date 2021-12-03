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

end
