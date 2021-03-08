class AddRepasswordToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users,:repassword,:string
  end
end
