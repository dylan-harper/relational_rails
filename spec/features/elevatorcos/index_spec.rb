require 'rails_helper'

RSpec.describe 'the elevatorcos index page' do
  it 'displays all elevatorcos' do
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

    visit "/elevatorcos"
    save_and_open_page

    expect(page).to have_content(elevatorco.name && elevatorco2.name)
    expect(page).to have_content(elevatorco.created_at && elevatorco2.created_at)
  end

end
