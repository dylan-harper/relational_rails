require 'rails_helper'

RSpec.describe 'the elevatorcos show page' do
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

  visit "/elevatorcos/#{@elevatorco.id}"
  end

  it 'displays elevatorcos name' do
    expect(page).to have_content(@elevatorco.name)
    expect(page).to_not have_content(@elevatorco2.name)
  end

  it 'displays elevatorcos address' do
    expect(page).to have_content(@elevatorco.address)
    expect(page).to_not have_content(@elevatorco2.address)
  end

  it 'displays elevatorcos num_technicians' do
    expect(page).to have_content(@elevatorco.num_technicians)
    expect(page).to_not have_content(@elevatorco2.num_technicians)
  end

  it 'displays elevatorcos offers?' do
    expect(page).to have_content(@elevatorco.offers_install?)
    expect(page).to have_content(@elevatorco.offers_service?)
    expect(page).to have_content(@elevatorco.offers_modernization?)
  end

  it 'displays num buildings' do
    expect(page).to have_content("Number of service contracts: #{@elevatorco.buildings.count}")
  end

  it 'displays created at' do
    expect(page).to have_content(@elevatorco.created_at)
  end

  it 'displays updated at' do
    expect(page).to have_content(@elevatorco.updated_at)
  end

  it 'links to current page' do
    click_link("#{@elevatorco.name}")

    expect(current_path).to eq("/elevatorcos/#{@elevatorco.id}")
  end

  it 'links to buildings main page' do
    click_link("Buildings")

    expect(current_path).to eq('/buildings')
  end

  it 'links to elevatorcos main page' do
    click_link("Elevator Companies")

    expect(current_path).to eq('/elevatorcos')
  end

  it 'links to elevatorco buildings page' do
    click_link("Buildings Under Service Contract")

    expect(current_path).to eq("/elevatorcos/#{@elevatorco.id}/buildings")
  end

  it 'links to elevator co update page' do
    click_link("Update Company Info")

    expect(current_path).to eq("/elevatorcos/#{@elevatorco.id}/edit")
  end

  it 'can delete elevatorco' do
    click_link("Delete Company")

    expect(current_path).to eq("/elevatorcos")
    expect(page).to_not have_content("#{@elevatorco.name}")
  end

end
