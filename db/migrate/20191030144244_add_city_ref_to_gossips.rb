class AddCityRefToGossips < ActiveRecord::Migration[5.2]
  def change
    add_reference :gossips, :city, foreign_key: true
  end
end
