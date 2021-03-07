class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.date :start_date
      t.date :end_date
      t.string :user_id
      t.string :room_id
      t.integer :total_price
      t.integer :group

      t.timestamps
    end
  end
end
