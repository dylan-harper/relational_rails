require 'rails_helper'

RSpec.describe 'elevatorcos edit' do
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

  end

  it 'can edit the company info' do
    @elevatorco3 = Elevatorco.create!(name: 'Sky Bros',
                                      address: '7439 Upper Limit',
                                      num_technicians: 7,
                                      offers_install?: true,
                                      offers_service?: true,
                                      offers_modernization?: true)
    visit "/elevatorcos/#{@elevatorco3.id}/edit"

    fill_in('name', with: 'Sky Brothers')
    fill_in('address', with: '7439 Upper Limit')
    fill_in('num_technicians', with: 9)
    choose('offers_install_true', option: true)
    choose('offers_service_true', option: true)
    choose('offers_modernization_true', option: true)
    click_button('Save Changes')

    expect(current_path).to eq("/elevatorcos/#{@elevatorco3.id}")
    expect(page).to have_content('Sky Brothers')
    expect(page).to_not have_content('Sky Bros')
  end
end
