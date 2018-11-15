class AddColumnBookings < ActiveRecord::Migration[5.2]
  def change
  	add_column :listings, :bookings, :string
  end
end
