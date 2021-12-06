class Bank < ApplicationRecord
  has_many :branches

  def branches_count
    self.branches.count
  end

end
