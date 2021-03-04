class Add1nPriceToReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations,:n1_price,:integer
  end
end
