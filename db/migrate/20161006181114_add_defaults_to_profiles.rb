class AddDefaultsToProfiles < ActiveRecord::Migration[5.0]
  def change
    change_column :profiles, :about, :text, :default => "---"
    change_column :profiles, :favorites, :string, :default => "---"
    change_column :profiles, :kegerator, :string, :default => "---"
    change_column :profiles, :homebrewer, :string, :default => "---"
  end
end
