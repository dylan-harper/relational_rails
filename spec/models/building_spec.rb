require 'rails_helper'

RSpec.describe Building do
  it {should belong_to :elevatorco}

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
                                   num_units: 1,
                                   year_installed: 19960101,
                                   needs_modernization?: true,
                                   last_serviced: 20211016,
                                   elevatorco_id: @elevatorco2.id)
      @building3 = Building.create!(name: 'Native Roots',
                                   address: '408 Broadway',
                                   owner: 'Phil Big',
                                   unit_type: 'vertical platform lift',
                                   num_units: 6,
                                   year_installed: 20140101,
                                   needs_modernization?: false,
                                   last_serviced: 20210702,
                                   elevatorco_id: @elevatorco2.id)
    end

    describe '#display_true' do
      it 'displays records where needs_modernization: true' do
        true_buildings = Building.display_true

        expect(true_buildings).to include(@building2)
        expect(true_buildings).to_not include(@building3)
        expect(true_buildings).to_not include(@building)
      end
    end

    describe '#sort_by_name' do
      it 'displays records in alphabetical order' do
        sorted = Building.sort_by_name

        expect(sorted.first).to eq(@building3)
        expect(sorted.last).to eq(@building)
      end
    end

    describe '#unit_threshold' do
      it 'returns only buildings with num_units more than entered amt' do
        filtered = Building.unit_threshold(4)

        expect(filtered).to eq([@building, @building3])
      end
    end
  end
end
