require 'rails_helper'

RSpec.describe 'the elevatorcos index page' do
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
    @elevatorco3 = Elevatorco.create!(name: 'Sky Bros',
                                      address: '7439 Upper Limit',
                                      num_technicians: 9,
                                      offers_install?: true,
                                      offers_service?: true,
                                      offers_modernization?: true)
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
    visit "/elevatorcos"
  end

  it 'displays all elevatorcos names' do
    expect(page).to have_content(@elevatorco.name)
    expect(page).to have_content(@elevatorco2.name)
    expect(page).to have_content(@elevatorco3.name)
  end

  it 'displays all elevatorcos created_at' do
    expect(page).to have_content(@elevatorco.created_at)
    expect(page).to have_content(@elevatorco2.created_at)
    expect(page).to have_content(@elevatorco3.created_at)
  end

  it 'sorts all elevatorcos by created_at' do
    expect(@elevatorco.name).to appear_before(@elevatorco2.name)
    expect(@elevatorco2.name).to appear_before(@elevatorco3.name)
    expect(@elevatorco2.name).to_not appear_before(@elevatorco.name)
    expect(@elevatorco3.name).to_not appear_before(@elevatorco2.name)
    expect(@elevatorco3.name).to_not appear_before(@elevatorco.name)
  end

  it 'links to buildings main page' do
    click_link("Buildings Main")

    expect(current_path).to eq('/buildings')
  end

  it 'links to elevatorco create form' do
    click_link("New Elevator Company")

    expect(current_path).to eq('/elevatorcos/new')
  end

  it 'links to edit form' do
    first(:link, "Edit Company Info").click

    expect(current_path).to eq("/elevatorcos/#{@elevatorco.id}/edit")
  end
end
