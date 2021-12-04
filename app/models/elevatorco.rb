class Elevatorco < ApplicationRecord
  has_many :buildings

  def sort_by_created
    Elevatorco.order("created_at")
  end

  def count_of_buildings
    self.buildings.count
  end
end
