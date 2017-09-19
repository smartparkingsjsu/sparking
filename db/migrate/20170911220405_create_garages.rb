class CreateGarages < ActiveRecord::Migration[5.1]
  def change
    create_table :garages do |t|
      t.string :name
      t.string :address
      t.float :weekday
      t.float :weekend

      t.timestamps
    end
  end
end
