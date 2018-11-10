class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.integer :max_seats
      t.integer :available_seats
      t.float :duration

      t.date :departure_date
      t.integer :departure_hour
      t.integer :departure_minutes

      t.date :arrival_date
      t.integer :arrival_hour
      t.integer :arrival_minutes
      
      t.references :departure, index: true
      t.references :destination, index: true
      t.timestamps
    end
  end
end
