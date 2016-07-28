class Booking < ActiveRecord::Base
  set_table_name :bookings
  set_primary_key :bookings_id

  belongs_to :car, :primary_key => :car_id, :foreign_key => :car_id
  default_scope :conditions => ["voided = ?", false]
end
