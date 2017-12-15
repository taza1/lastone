class Bike < ApplicationRecord

  def self.is_rented(bike)
    @is_rented = false
    @today = Time.now
    @rentals = Bikerental.where(:bike_id => bike.id).where("start_date <= ? and end_date >= ?", @today, @today)
    if @rentals.size > 0 then 
      @is_rented = true
    end
    return @is_rented
  end

  def self.bikes_rented
    @bikes = Bike.all
    @bikes_rented = []
    for @bike in @bikes do
     if Bike.is_rented(@bike) == true then
      @bikes_rented.push(@bike)
     end
    end
    return @bikes_rented
  end
  def self.search(search)
        #where("name LIKE ? OR Description LIKE ?", "%#{search}%", "%#{search}%") 
      where("name LIKE ? ", "%#{search}%")
  end

  

end
