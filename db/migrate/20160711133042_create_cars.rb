class CreateCars < ActiveRecord::Migration
  def self.up
    create_table :cars, :primary_key => :car_id do |t|
      t.string :name
      t.string :engine_size
      t.integer :seats
      t.string :description
      t.string :path
      t.string :alt
      t.timestamps
    end
  end

  def self.down
    drop_table :cars
  end
end
