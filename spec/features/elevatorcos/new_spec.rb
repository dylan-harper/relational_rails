require 'rails_helper'

RSpec.describe 'the elevatorcos new page' do
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
                                 num_units: 1,
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
  end

  it 'can create a new elevator company' do
    visit '/elevatorcos/new'

    fill_in('name', with: 'Sky Bros')
    fill_in('address', with: '7439 Upper Limit')
    fill_in('num_technicians', with: 7)
    choose('offers_install_true', option: true)
    choose('offers_service_true', option: true)
    choose('offers_modernization_true', option: true)
    click_button('Add Elevator Company')
    new_elevatorco_id = Elevatorco.last.id
    expect(current_path).to eq("/elevatorcos/#{new_elevatorco_id}")
    expect(page).to have_content('Sky Bros')
  end

  it 'links to current page' do
    visit '/elevatorcos/new'
    click_link "Add Elevator Company"

    expect(current_path).to eq('/elevatorcos/new')
  end

  it 'links to elevatorcos index' do
    visit '/elevatorcos/new'
    click_link("Back to Elevator Companies")

    expect(current_path).to eq('/elevatorcos')
  end

  it 'links to buildings index' do
    visit '/elevatorcos/new'
    click_link("Buildings")

    expect(current_path).to eq('/buildings')
  end 
end
