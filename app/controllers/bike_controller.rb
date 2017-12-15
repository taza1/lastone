class BikeController < ApplicationController
  def bikes
    @bikes = Bike.all
  end
 
  def rent_a_bike
    @bike_id = params[:bike_id]
    @bike = Bike.find_by_id(@bike_id)
    
  end

  def save_bike_rental
    @days = params[:anything][:days]
    @bike_id = params[:anything][:bike_id]
    @bike = Bike.find_by_id(@bike_id)
    @today = Time.now.to_s
    @end_date = Time.now + @days.to_i.days
    puts "Today: " + @today
    puts "End date: " + @end_date.to_s
    Bikerental.create!(user_id: current_user.id, bike_id: @bike_id.to_i, days: @days, start_date: @today, end_date: @end_date)
    flash[:notice] = "Bike rented added."
    redirect_to :bikes
  end
  
  def index
    #@bikes = bike.all
	   if params[:search]
      @bikes = Bike.search(params[:search]).order("created_at DESC")
     else  
      @bikes = Bike.all.order("created_at DESC")
    end
  end
#Search code is correct and should work.
end
