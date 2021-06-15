class AirlinesController < ApplicationController
  def show
    @airline = Airline.find(params[:id])
    @adult_passengers = @airline.passengers.adult_passengers.distinct
  end
end
