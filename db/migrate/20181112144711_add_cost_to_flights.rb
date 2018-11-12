class AddCostToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :ticket_cost, :float
  end
end
