class Building < ApplicationRecord
  belongs_to :elevatorco

  def self.display_true
    Building.where(needs_modernization?: true)
  end

  def self.sort_by_name
    Building.order("name")
  end
end
