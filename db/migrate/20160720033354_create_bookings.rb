class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings, :primary_key => :bookings_id do |t|
      t.integer :car_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :start_date
      t.string :end_date
      t.timestamps
    end
  end

  def self.down
    drop_table :bookings
  end
end
