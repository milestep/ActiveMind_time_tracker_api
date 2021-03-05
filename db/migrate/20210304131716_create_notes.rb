class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.integer :hours
      t.string :date

      t.timestamps
    end
  end
end
