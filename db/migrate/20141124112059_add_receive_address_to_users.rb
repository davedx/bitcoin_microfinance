class AddReceiveAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :receive_address, :string
  end
end
