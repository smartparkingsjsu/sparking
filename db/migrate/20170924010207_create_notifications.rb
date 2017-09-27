class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.references :booking, foreign_key: true
      t.float :confidence
      t.string :action
      t.datetime :read_at

      t.timestamps
    end
  end
end
