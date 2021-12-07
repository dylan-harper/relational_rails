class Branch < ApplicationRecord
  belongs_to :bank

  def self.display_true
    branches_with_atm = Branch.where(has_atm: true)
  end

  def self.revenue_threshold(revenue)
    Branch.where('quarterly_rev >= ?', revenue)
  end
end
