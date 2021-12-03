class Elevatorco < ApplicationRecord
  has_many :buildings

  def sort_by_created
    Elevatorco.order("created_at")
  end
end
