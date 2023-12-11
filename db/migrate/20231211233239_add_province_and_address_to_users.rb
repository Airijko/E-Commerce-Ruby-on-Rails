class AddProvinceAndAddressToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :province, :string
    add_column :users, :address, :string
  end
end
