class AddCoordinatesToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :latitude, :float
    add_column :profiles, :longitude, :float
    add_column :profiles, :full_address, :string
  end
end
