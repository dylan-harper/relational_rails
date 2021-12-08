# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@bank_1 = Bank.create!(name: 'Wells Fargo',
                      hq_city_state: 'San Francisco, California',
                      fdic_ins: true,
                      mobile_app: true,
                      size_by_assets: 1303558000)
@branch_1 = @bank_1.branches.create!(name: "Branch",
                                      zip_code: 123456,
                                      has_atm: true,
                                      quarterly_rev: 1000000)

@bank_2 = Bank.create!(name: 'Chase',
                        hq_city_state: 'New York City, New York',
                        fdic_ins: true,
                        mobile_app: true,
                        size_by_assets: 3757576000)
@branch_2 = @bank_2.branches.create!(name: "Other Branch",
                                    zip_code: 654321,
                                    has_atm: false,
                                    quarterly_rev: 2000000)

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
                                  num_technicians: 7,
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
