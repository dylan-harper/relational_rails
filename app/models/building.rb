class Building < ApplicationRecord
  belongs_to :elevatorco

  def display_true
    Building.where(needs_modernization?: true)  
  end
end
