require 'rails_helper'

RSpec.describe Branch do
  it {should belong_to :bank}
end
