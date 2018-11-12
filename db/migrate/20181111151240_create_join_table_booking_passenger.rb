class CreateJoinTableBookingPassenger < ActiveRecord::Migration[5.2]
  def change
    create_join_table :bookings, :passengers do |t|
    	t.references :booking, foreign_key: true
    	t.references :passenger, foreign_key: true
    end
  end
end
