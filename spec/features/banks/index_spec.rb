require 'rails_helper'

RSpec.describe 'bank index' do

  it 'can dipslay all banks' do
    bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    bank_2 = Bank.create!(name: 'Chase',
                          hq_city_state: 'New York City, New York',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 3757576000)
    visit "/banks"

    expect(page).to have_content(bank_1.name)
    expect(page).to have_content(bank_2.name)
  end

end
