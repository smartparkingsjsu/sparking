class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :start_time
      t.datetime :end_time
      t.integer :length
      t.belongs_to :garage_spot, foreign_key: true
      t.belongs_to :user, foreign_key: true
    end
  end
end
