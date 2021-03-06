require 'rails_helper'

RSpec.describe 'bank index' do
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
  end

  it 'can dipslay all banks' do
    visit "/banks"

    expect(page).to have_content(@bank_1.name)
    expect(page).to have_content(@bank_2.name)
  end

  it 'orders records by recently created and lists created_at' do
    visit "/banks"

    expect(page).to have_content(@bank_1.created_at)
    expect(page).to have_content(@bank_2.created_at)
    expect(page).to have_content(@bank_3.created_at)

    expect(@bank_1.name).to appear_before(@bank_2.name)
    expect(@bank_2.name).to appear_before(@bank_3.name)
  end

  it 'has a link to the branches index' do
    visit "/banks"

    click_on "Branches Main"

    expect(current_path).to eq("/branches")
  end

  it 'can delete the bank from the index page' do
    bank = Bank.create!(name: 'BNP Paribas',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)

    visit '/banks'

    click_link "Delete #{bank.name}"

    expect(current_path).to eq('/banks')
    expect(page).to_not have_content(bank.name)
  end

  it 'links to parent edit page' do
    visit "/banks"

    click_link("Edit #{@bank_1.name}")

    expect(current_path).to eq("/banks/#{@bank_1.id}/edit")
  end

end
