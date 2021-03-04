class AddRoomImageToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations,:room_image,:string
    add_column :reservations,:room_name,:string
  end
end
