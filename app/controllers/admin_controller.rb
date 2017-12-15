class AdminController < ApplicationController
  

  def index
    @all_bikes_count = Bike.all.count
    @count_bikes_rented = Bike.bikes_rented.size
    @count_bike_rental_requests = Bikerental.all.count
    @users = User.all
  end

  def show_bikes
    @bike_type = params[:bike_type]
    if @bike_type == "all" then
      @bikes = Bike.all
    else
      @bikes = Bike.bikes_rented
    end

  end

  def show_bike_rentals
    @user_type = params[:user_type]
    if @user_type == "all" then
      @bike_rentals = Bikerental.all
    else
      @bike_rentals = Bikerental.where(:user_id => @user_type.to_i)
    end

  end



end
