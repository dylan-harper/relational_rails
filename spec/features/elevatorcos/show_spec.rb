require 'rails_helper'

RSpec.describe 'the elevatorcos show page' do
  it 'displays elevatorcos name' do
    elevatorco = Elevatorco.create!(name: 'Vertical Transport',
                                    address: '5624 Elevation Dr.',
                                    num_technicians: 27,
                                    offers_install?: true,
                                    offers_service?: true,
                                    offers_modernization?: true)
    elevatorco2 = Elevatorco.create!(name: 'Ascend',
                                     address: '9441 Skyscraper Ave.',
                                     num_technicians: 16,
                                     offers_install?: false,
                                     offers_service?: true,
                                     offers_modernization?: false)

    visit "/elevatorcos/#{elevatorco.id}"
    save_and_open_page
    expect(page).to have_content(elevatorco.name)
    expect(page).to_not have_content(elevatorco2.name)
    expect(page).to have_content(elevatorco.address)
    expect(page).to_not have_content(elevatorco2.address)
    expect(page).to have_content(elevatorco.num_technicians)
    expect(page).to_not have_content(elevatorco2.num_technicians)
    expect(page).to have_content(elevatorco.offers_install?)
    expect(page).to have_content(elevatorco.offers_service?)
    expect(page).to have_content(elevatorco.offers_modernization?)
  end

end
