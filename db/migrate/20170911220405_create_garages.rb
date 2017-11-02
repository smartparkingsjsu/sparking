class CreateGarages < ActiveRecord::Migration[5.1]
  def change
    create_table :garages do |t|
      t.string :name
      t.string :address
      t.float :weekday
      t.float :weekend

      t.string :email,              null: false, default: ""
      t.boolean :notify,             null: false, default: "f"

      t.timestamps
    end

    add_index :garages, :email,                  unique: true
  end
end