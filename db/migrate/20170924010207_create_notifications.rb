class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
      t.integer :recipient_id
      t.integer :event_id
      t.datetime :read_at
      t.string :action

      t.timestamps
    end
  end
end
