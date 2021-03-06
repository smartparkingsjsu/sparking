class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.references :booking, foreign_key: true
      t.float :amount
      t.string :token
      t.boolean :paid, null: false, default: "t"

      t.timestamps
    end
  end
end
