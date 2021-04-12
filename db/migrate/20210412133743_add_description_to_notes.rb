class AddDescriptionToNotes < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :description, :string
  end
end
