require 'rails_helper'

RSpec.describe Elevatorco, type: :model do
  it {should have_many :buildings}

  describe 'instance methods' do
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
                                  last_serviced: 20180422,
                                  elevatorco_id: @elevatorco.id)
      @building2 = Building.create!(name: 'Toothpick Factory',
                                   address: '46112 Point View',
                                   owner: 'Salvador Datun',
                                   unit_type: 'freight',
                                   num_units: '1',
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
    describe '#sort_by_created' do
      it 'sorts elevatorco by created_at' do
        expect(@elevatorco.sort_by_created.first).to eq(@elevatorco)
        expect(@elevatorco.sort_by_created.last).to eq(@elevatorco2)
      end
    end

    describe '#count_of_buildings' do
      it 'returns number of buildings for an elevatorco' do
        expect(@elevatorco.count_of_buildings).to eq(1)
        expect(@elevatorco2.count_of_buildings).to eq(2)
      end
    end 

  end
end
