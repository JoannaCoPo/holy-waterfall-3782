require 'rails_helper'

RSpec.describe Flight, type: :model do
  it {should belong_to :airline}
  it {should have_many(:passengers).through(:passenger_flights)}
end
