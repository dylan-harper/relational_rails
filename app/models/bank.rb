class Bank < ApplicationRecord
  has_many :branches, dependent: :destroy

  def branches_count
    self.branches.count
  end

  def order_by_name
    self.branches.order('name').all
  end

  def self.sort_by_created
    Bank.order("created_at")
  end

end
