require 'rails_helper'

RSpec.describe 'Elevatorcos Buildings Index' do
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
    visit "/elevatorcos/#{@elevatorco2.id}/buildings"
  end

  it 'shows all building names for the elevatorco' do
    expect(page).to have_content(@building2.name)
    expect(page).to have_content(@building3.name)
  end

  it 'links to buildings main page' do
    click_link("Buildings Main")

    expect(current_path).to eq('/buildings')
  end

  it 'links to add new building' do
    click_link("Add New Service Contract")

    expect(current_path).to eq("/elevatorcos/#{@elevatorco2.id}/buildings/new")
  end

  it 'lists buildings in alphabetical order' do
    click_link("Sort Alphabetically")

    expect(current_path).to eq("/elevatorcos/#{@elevatorco2.id}/buildings/alpha")
  end

end
