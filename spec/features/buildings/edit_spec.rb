require 'rails_helper'

RSpec.describe 'the buildings show page' do
  before(:each) do
    @elevatorco = Elevatorco.create!(name: 'Vertical Transport',
                                    address: '5624 Elevation Dr.',
                                    num_technicians: 27,
                                    offers_install?: true,
                                    offers_service?: true,
                                    offers_modernization?: true)
    @elevatorco2 = Elevatorco.create!(name: 'Ascend',
                                     address: '9441 Skyscraper Ave.',
                                     num_technicians: 16,
                                     offers_install?: false,
                                     offers_service?: true,
                                     offers_modernization?: false)
    @building = Building.create!(name: 'Tropical Resort',
                                address: '902 W Coconut Way',
                                owner: 'Zed Colada',
                                unit_type: 'passenger',
                                num_units: 8,
                                year_installed: '2018-01-01',
                                needs_modernization?: false,
                                last_serviced: '2021-10-16',
                                elevatorco_id: @elevatorco.id)
    @building2 = Building.create!(name: 'Toothpick Factory',
                                 address: '46112 Point View',
                                 owner: 'Salvador Datun',
                                 unit_type: 'freight',
                                 num_units: '1',
                                 year_installed: '1996-01-01',
                                 needs_modernization?: true,
                                 last_serviced: '2021-10-16',
                                 elevatorco_id: @elevatorco2.id)
    @building3 = Building.create!(name: 'Native Roots',
                                address: '408 Broadway',
                                owner: 'Phil Big',
                                unit_type: 'vertical platform lift',
                                num_units: 1,
                                year_installed: '2014-01-01',
                                needs_modernization?: false,
                                last_serviced: '2021-07-02',
                                elevatorco_id: @elevatorco2.id)
    visit "/buildings/#{@building.id}/edit"
  end

  it 'can edit building info' do
    @building4 = Building.create!(name: 'Westward Mall',
                                  address: '624 West Highway 72',
                                  owner: 'Hugh North Jr.',
                                  unit_type: 'LULA',
                                  num_units: 4,
                                  year_installed: '2008-01-01',
                                  needs_modernization?: true,
                                  last_serviced: '2021-02-06',
                                  elevatorco_id: @elevatorco.id)
    click_link('Update Building Info')

    fill_in('name', with: 'Westworld Mall')
    fill_in('address', with: '624 West Highway 72')
    fill_in('owner', with: 'Hugh North Jr.')
    fill_in('unit_type', with: 'LULA')
    fill_in('num_units', with: 4)
    fill_in('year_installed', with: '2008-01-01')
    fill_in('needs_modernization', with: true)
    fill_in('last_serviced', with: '2021-02-06')
    click_button("Update Building Info")

    expect(current_path).to eq("/buildings/#{@building4.id}")
    expect(page).to have_content('Westworld Mall')
    expect(page).to_not have_content('Westward Mall')
  end
end  
