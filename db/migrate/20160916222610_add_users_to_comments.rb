class AddUsersToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :user_id, :integer
    remove_column :comments, :author, :string
  end
end
