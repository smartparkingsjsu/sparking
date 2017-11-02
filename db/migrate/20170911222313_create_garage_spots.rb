class CreateGarageSpots < ActiveRecord::Migration[5.1]
  def change
    create_table :garage_spots do |t|
      t.references :garage, foreign_key: true
      t.references :spot, foreign_key: true
      t.string :serial

      t.timestamps
    end
  end
end
