class AddVoidedToBookings < ActiveRecord::Migration
  def self.up
    add_column :bookings, :voided, :boolean, :default => false
    add_column :bookings, :voided_by, :string
  end

  def self.down
    remove_column :bookings, :voided_by
    remove_column :bookings, :voided
  end
end
