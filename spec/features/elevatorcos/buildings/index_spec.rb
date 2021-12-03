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
                                year_installed: 20180101,
                                needs_modernization?: false,
                                last_serviced: 20211016,
                                elevatorco_id: @elevatorco.id)
    @building2 = Building.create!(name: 'Toothpick Factory',
                                 address: '46112 Point View',
                                 owner: 'Salvador Datun',
                                 unit_type: 'freight',
                                 num_units: 1,
                                 year_installed: 19960101,
                                 needs_modernization?: true,
                                 last_serviced: 20211016,
                                 elevatorco_id: @elevatorco2.id)
    @building3 = Building.create!(name: 'Native Roots',
                                 address: '408 Broadway',
                                 owner: 'Phil Big',
                                 unit_type: 'vertical platform lift',
                                 num_units: 1,
                                 year_installed: 20140101,
                                 needs_modernization?: false,
                                 last_serviced: 20210702,
                                 elevatorco_id: @elevatorco2.id)
  end

  it 'shows all buildings for the elevatorco' do
    visit "/elevatorcos/#{@elevatorco2.id}/buildings"
    save_and_open_page
    expect(page).to have_content(@building2.name)
    expect(page).to have_content(@building3.name)
  end
end