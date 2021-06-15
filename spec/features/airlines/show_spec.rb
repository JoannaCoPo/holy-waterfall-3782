require 'rails_helper'

RSpec.describe 'flights index page,' do
  before :each do
    @airline_1 = Airline.create!(name: "Spirit")

    @flight_1 = @airline_1.flights.create!(number: "4321", date: "07/20/2021", departure_city: "Miami", arrival_city: "Cartegena")
    @flight_2 = @airline_1.flights.create!(number: "1234", date: "09/30/2021", departure_city: "Denver", arrival_city: "Austin")

    @passenger_1 = Passenger.create!(name: "Oscar Cortes", age: 40)
    @passenger_2 = Passenger.create!(name: "Kyla Benson", age: 32)
    @passenger_3 = Passenger.create!(name: "George Smith", age: 60)

    PassengerFlight.create!(passenger:@passenger_1, flight: @flight_1)
    PassengerFlight.create!(passenger:@passenger_2, flight: @flight_1)
    PassengerFlight.create!(passenger:@passenger_3, flight: @flight_1)
    PassengerFlight.create!(passenger:@passenger_3, flight: @flight_1)

    visit airline_path(@airline_1)
  end

  it 'displays names of passengers on flights' do

    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_2.name)
    expect(page).to have_content(@passenger_3.name, count:1)
  end
end
