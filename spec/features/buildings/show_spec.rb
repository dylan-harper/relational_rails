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
    visit "/buildings/#{@building.id}"
  end
  it 'displays buildings name' do
    expect(page).to have_content(@building.name)
    expect(page).to_not have_content(@building2.name)
  end
  it 'displays buildings address' do
    expect(page).to have_content(@building.address)
    expect(page).to_not have_content(@building2.address)
  end
  it 'displays buildings owner' do
    expect(page).to have_content(@building.owner)
  end
  it 'dispays buildings unit type' do
    expect(page).to have_content(@building.unit_type)
  end
  it 'displays buildings num_units' do
    expect(page).to have_content(@building.num_units)
  end
  it 'displays buildings year_installed' do
    expect(page).to have_content(@building.year_installed.strftime("%F"))
  end
  it 'displays buildings needs_modernization?' do
    expect(page).to have_content(@building.needs_modernization?)
  end
  it 'displays buildings last_serviced' do
    expect(page).to have_content(@building.last_serviced.strftime("%F"))
  end
  it 'displays buildings elevatorco name' do
    expect(page).to have_content(@elevatorco.name)
  end

  it 'links to buildings main page' do
    click_link("Back to Buildings Main")

    expect(current_path).to eq('/buildings')
  end

  it 'links to elevatorcos main page' do
    click_link("Elevator Companies Main")

    expect(current_path).to eq('/elevatorcos')
  end

  it 'links to edit form' do
    click_link("Update Building Info")

    expect(current_path).to eq("/buildings/#{@building.id}/edit") 
  end

end
