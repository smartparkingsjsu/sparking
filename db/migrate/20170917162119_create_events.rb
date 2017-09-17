class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :booking, foreign_key: true
      t.float :confidence

      t.timestamps
    end
  end
end
