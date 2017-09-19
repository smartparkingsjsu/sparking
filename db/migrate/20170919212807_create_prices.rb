class CreatePrices < ActiveRecord::Migration[5.1]
  def change
    create_table :prices do |t|
      t.references :garage, foreign_key: true
      t.float :weekday
      t.float :weekend

      t.timestamps
    end
  end
end
