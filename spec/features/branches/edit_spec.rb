require 'rails_helper'

RSpec.describe 'branch edit' do

  before :each do
    @bank = Bank.create!(name: 'Chase',
                            hq_city_state: 'New York City, New York',
                            fdic_ins: true,
                            mobile_app: true,
                            size_by_assets: 3757576000)
    @branch = @bank.branches.create!(name: "Branch",
                            zip_code: 123456,
                            has_atm: true,
                            quarterly_rev: 1000000)
  end

  it 'links to the edit page' do

    visit "/banks/#{@bank.id}/branches"
    click_link "#{@branch.name}"
    click_button "Edit #{@branch.name}"

    expect(current_path).to eq("/branches/#{@branch.id}/edit")
  end

  it 'can edit the branch' do

    visit "/branches/#{@branch.id}"

    expect(page).to have_content('Branch')

    click_button 'Edit Branch'

    fill_in 'Name', with: 'New Branch'
    click_button 'Update Branch'

    expect(current_path).to eq("/branches/#{@branch.id}")
    expect(page).to have_content('New Branch')
  end
end
