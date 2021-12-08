# User Story 11, Parent Creation (x2)
#
# As a visitor
# When I visit the Parent Index page
# Then I see a link to create a new Parent record, "New Parent"
# When I click this link
# Then I am taken to '/parents/new' where I  see a form for a new parent record
# When I fill out the form with a new parent's attributes:
# And I click the button "Create Parent" to submit the form
# Then a `POST` request is sent to the '/parents' route,
# a new parent record is created,
# and I am redirected to the Parent Index page where I see the new Parent displayed.
require 'rails_helper'

RSpec.describe 'Bank Creation' do

  it 'links to the new page from the banks index' do
    visit '/banks'

    click_link('New Bank')

    expect(current_path).to eq('/banks/new')
  end

  it 'can create a new bank' do
    bank_1 = Bank.create!(name: 'Wells Fargo',
                          hq_city_state: 'San Francisco, California',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 1303558000)
    bank_2 = Bank.create!(name: 'BoA',
                          hq_city_state: 'Charlotte, North Carolina',
                          fdic_ins: true,
                          mobile_app: true,
                          size_by_assets: 2303558000)

    visit 'banks/new'

    name = bank_2.name
    hq_city_state = bank_2.hq_city_state
    fdic_ins = bank_2.fdic_ins
    mobile_app = bank_2.mobile_app
    size_by_assets = bank_2.size_by_assets

    fill_in('Name', with: name)
    fill_in('Hq city state', with: hq_city_state)
    choose(:fdic_ins_true)
    choose(:mobile_app_true)
    fill_in('Size by assets', with: size_by_assets)
    click_button('Create Bank')


    bank_id = bank_2.id
    expect(current_path).to eq("/banks")
    expect(page).to have_content("BoA")
  end
end
