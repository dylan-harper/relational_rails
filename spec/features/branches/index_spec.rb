require 'rails_helper'

RSpec.describe 'branches index' do

  it 'can display all branches' do

    branch_1 = Branch.create!(name: 'Branch',
                              zip_code: 123456,
                              has_atm: true,
                              quarterly_rev: 1000000,
                              bank_id: 3)
    branch_2 = Branch.create!(name: 'Other Branch',
                              zip_code: 654321,
                              has_atm: false,
                              quarterly_rev: 2000000,
                              bank_id: 4)

    visit "/branches"

    expect(page).to have_content(branch_1.name)
    expect(page).to have_content(branch_2.name)
  end

end
