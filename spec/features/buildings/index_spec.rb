require 'rails_helper'

RSpec.describe 'the building index page' do
  it 'displays all buildings' do
    building = Building.create!(name: 'Tropical Resort',
                                address: '902 W Coconut Way',
                                owner: 'Zed Colada',
                                unit_type: 'passenger',
                                num_units: 8,
                                year_installed: 2008,
                                needs_modernization?: false,
                                last_serviced: 10162021)
    building2 = Building.create!(name: 'Toothpick Factory',
                                 address: '46112 Point View',
                                 owner: 'Salvador Datun',
                                 unit_type: 'freight',
                                 num_units: '1',
                                 year_installed: 1996,
                                 needs_modernization:? true,
                                 last_serviced: 04222021)

    visit "/buildings"

    expect(page).to have_content(building.name && building2.name)
  end
end 
