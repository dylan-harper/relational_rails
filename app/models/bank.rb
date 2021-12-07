class Bank < ApplicationRecord
  has_many :branches, dependent: :destroy

  def branches_count
    self.branches.count
  end

end
