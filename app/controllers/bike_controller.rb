class BikeController < ApplicationController
  def bikes
    @bikes = Bike.all
  end
end
