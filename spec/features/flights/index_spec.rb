require 'rails_helper'

RSpec.describe 'flights index page,' do
  before :each do
    @airline_1 = Airline.create!(name: "Spirit")
    @airline_2 = Airline.create!(name: "Frontier")
    @airline_3 = Airline.create!(name: "Southwest")

    @flight_1 = @airline_1.flights.create!(number: "4321", date: "07/20/2021", departure_city: "Miami", arrival_city: "Cartegena")
    @flight_2 = @airline_2.flights.create!(number: "1234", date: "09/30/2021", departure_city: "Denver", arrival_city: "Austin")
    @flight_3 = @airline_3.flights.create!(number: "1798", date: "08/01/2021", departure_city: "San Diego", arrival_city: "Denver")
    @flight_4 = @airline_2.flights.create!(number: "1798", date: "10/07/2021", departure_city: "Portland", arrival_city: "Detroit")

    @passenger_1 = Passenger.create!(name: "Oscar Cortes", age: 40)
    @passenger_2 = Passenger.create!(name: "Kyla Benson", age: 32)
    @passenger_3 = Passenger.create!(name: "George Smith", age: 60)
    @passenger_4 = Passenger.create!(name: "Amy Lee", age: 36)
    @passenger_5 = Passenger.create!(name: "Alex Lee", age: 7)

    PassengerFlight.create!(passenger:@passenger_1, flight: @flight_1)
    PassengerFlight.create!(passenger:@passenger_2, flight: @flight_2)
    PassengerFlight.create!(passenger:@passenger_3, flight: @flight_3)
    PassengerFlight.create!(passenger:@passenger_4, flight: @flight_4)
    PassengerFlight.create!(passenger:@passenger_5, flight: @flight_4)

    visit flights_path
  end

  it 'displays flight numbers' do
    expect(page).to have_content(@flight_1.number)
    expect(page).to have_content(@flight_2.number)
    expect(page).to have_content(@flight_3.number)
    expect(page).to have_content(@flight_4.number)
  end

  it 'displays flight ariline name' do
    expect(page).to have_content(@airline_1.name)
    expect(page).to have_content(@airline_2.name)
    expect(page).to have_content(@airline_3.name)
  end #if time play around with alternate set up in view with helper

  it 'displays names of passengers on flights' do
    save_and_open_page
    expect(page).to have_content(@passenger_1.name)
    expect(page).to have_content(@passenger_2.name)
    expect(page).to have_content(@passenger_3.name)
    expect(page).to have_content(@passenger_4.name)
  end
end
