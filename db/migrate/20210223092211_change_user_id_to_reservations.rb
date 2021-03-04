class ChangeUserIdToReservations < ActiveRecord::Migration[5.0]
  def change
    change_column :reservations,:user_id,:integer
    change_column :reservations,:room_id,:integer
  end
end
