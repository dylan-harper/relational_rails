# User Story 13, Parent Child Creation (x2)
#
# As a visitor
# When I visit a Parent Childs Index page
# Then I see a link to add a new adoptable child for that parent "Create Child"
# When I click the link
# I am taken to '/parents/:parent_id/child_table_name/new' where I see a form to add a new adoptable child
# When I fill in the form with the child's attributes:
# And I click the button "Create Child"
# Then a `POST` request is sent to '/parents/:parent_id/child_table_name',
# a new child object/row is created for that parent,
# and I am redirected to the Parent Childs Index page where I can see the new child listed
require 'rails_helper'

RSpec.describe 'Branch Creation' do
  before :each do
    @bank = Bank.create!(name: 'Chase',
                            hq_city_state: 'New York City, New York',
                            fdic_ins: true,
                            mobile_app: true,
                            size_by_assets: 3757576000)
    # @branch = @bank.branches.create!(name: "Branch",
    #                                       zip_code: 123456,
    #                                       has_atm: true,
    #                                       quarterly_rev: 1000000)
  end

   it 'links to the new page from the bank_branches index' do
     visit "/banks/#{@bank.id}/branches"

     click_link('New Branch')

     expect(current_path).to eq("/banks/#{@bank.id}/branches/new")
   end

   it 'can create a new branch' do
     visit "/banks/#{@bank.id}/branches/new"

     fill_in('Name', with: 'Lake Street')
     fill_in('Zip code', with: 98653)
     choose(:has_atm_true)
     fill_in('Quarterly rev', with: 500000)
     click_button('Create Branch')

     expect(current_path).to eq("/banks/#{@bank.id}/branches")
     expect(page).to have_content("Lake Street")
   end

end
