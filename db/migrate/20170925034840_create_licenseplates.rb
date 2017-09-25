class CreateLicenseplates < ActiveRecord::Migration[5.1]
  def change
    create_table :licenseplates do |t|
      t.string :license_plate
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
