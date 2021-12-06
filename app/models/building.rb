class Building < ApplicationRecord
  belongs_to :elevatorco

  def self.display_true
    Building.where(needs_modernization?: true)  
  end
end
