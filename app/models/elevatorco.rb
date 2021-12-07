class Elevatorco < ApplicationRecord
  has_many :buildings, dependent: :destroy 

  def self.sort_by_created
    Elevatorco.order("created_at")
  end

  def count_of_buildings
    self.buildings.count
  end
end
