class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages, :primary_key => :page_id do |t|
      t.string :type
      t.text :content, :limit => 4294967295
      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
