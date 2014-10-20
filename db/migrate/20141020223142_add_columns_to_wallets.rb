class AddColumnsToWallets < ActiveRecord::Migration
  def change
    add_column :wallets, :type, :string
  end
end
