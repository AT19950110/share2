class AddRoomImageToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :rooms, :room_image, :string
  end
end
