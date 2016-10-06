class AddAboutToProfiles < ActiveRecord::Migration[5.0]
  def change
    add_column :profiles, :about, :text
    add_column :profiles, :favorites, :string
    add_column :profiles, :kegerator, :string
    add_column :profiles, :homebrewer, :string
  end
end
