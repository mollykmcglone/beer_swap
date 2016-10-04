class AddUsersToBeers < ActiveRecord::Migration[5.0]
  def change
    add_column(:beers, :user_id, :integer)
    remove_column(:beers, :profile_id, :integer)
  end
end
