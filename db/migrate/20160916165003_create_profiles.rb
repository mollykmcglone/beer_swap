class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.column :user_id, :integer
      t.column :address, :string
      t.column :city, :string
      t.column :state, :string
      t.column :zipcode, :integer

      t.timestamps
    end
  end
end
