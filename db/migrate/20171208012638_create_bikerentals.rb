class CreateBikerentals < ActiveRecord::Migration[5.1]
  def change
    create_table :bikerentals do |t|
      t.integer :bike_id
      t.integer :days
      t.datetime :start_date
      t.datetime :end_date
      t.string :status
      t.timestamps
    end
  end
end
