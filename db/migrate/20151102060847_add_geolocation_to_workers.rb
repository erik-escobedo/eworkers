class AddGeolocationToWorkers < ActiveRecord::Migration
  def change
    add_column :workers, :latitude, :float
    add_column :workers, :longitude, :float

    add_index :workers, :latitude
    add_index :workers, :longitude
  end
end
