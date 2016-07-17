class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings, :primary_key => :settings_id do |t|
      t.string :key
      t.string :value
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
