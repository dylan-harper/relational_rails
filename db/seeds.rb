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
