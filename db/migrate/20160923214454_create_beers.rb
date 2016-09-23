class CreateBeers < ActiveRecord::Migration[5.0]
  def change
    create_table :beers do |t|
      t.column :name, :string
      t.column :container_type, :string
      t.column :description, :text
      t.column :abv, :decimal
      t.column :brew_date, :string
      t.column :homebrew, :boolean
      t.column :brewery_name, :string
      t.column :profile_id, :integer
      t.column :style_id, :integer

      t.timestamps
    end
  end
end
