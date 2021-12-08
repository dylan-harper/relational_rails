# User Story 12, Parent Update (x2)
#
# As a visitor
# When I visit a parent show page
# Then I see a link to update the parent "Update Parent"
# When I click the link "Update Parent"
# Then I am taken to '/parents/:id/edit' where I  see a form to edit the parent's attributes:
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/parents/:id',
# the parent's info is updated,
# and I am redirected to the Parent's Show page where I see the parent's updated info
require 'rails_helper'

RSpec.describe 'Bank edit' do
  it 'links to the edit page' do
    bank = Bank.create!(name: 'Chase',
                            hq_city_state: 'New York City, New York',
                            fdic_ins: true,
                            mobile_app: true,
                            size_by_assets: 3757576000)

    visit '/banks'

    click_link "Edit #{bank.name}"

    expect(current_path).to eq("/banks/#{bank.id}/edit")
  end

  it 'can edit the bank' do
    bank = Bank.create!(name: 'Chase',
                            hq_city_state: 'New York City, New York',
                            fdic_ins: true,
                            mobile_app: true,
                            size_by_assets: 3757576000)

    visit "/banks"

    expect(page).to have_content('Chase')

    click_link 'Edit Chase'

    fill_in 'Name', with: 'JP Morgan Chase'
    click_button 'Update Bank'

    expect(current_path).to eq("/banks")
    expect(page).to have_content('JP Morgan Chase')
  end
end
