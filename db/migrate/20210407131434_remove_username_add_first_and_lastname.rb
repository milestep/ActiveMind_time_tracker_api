class RemoveUsernameAddFirstAndLastname < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :username
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
  end
end
