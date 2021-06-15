class Passenger < ApplicationRecord
  has_many :passenger_flights
  has_many :flights, through: :passenger_flights

  def self.adult_passengers
    where('age >= 18')
  end
end
