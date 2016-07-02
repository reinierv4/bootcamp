class AddGeolocationToSchool < ActiveRecord::Migration
  def change
    add_column :schools, :lat, :decimal
    add_column :schools, :lon, :decimal
  end
end
