class CreateTables < ActiveRecord::Migration[6.0]
  def change
    create_table :tables do |t|
      t.string :name
      t.string :color
      t.integer :user_id, null: false

      t.timestamps
    end
    add_index :tables, :user_id
  end
end
