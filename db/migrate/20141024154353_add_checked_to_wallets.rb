class AddCheckedToWallets < ActiveRecord::Migration
  def change
    add_column :wallets, :checked, :boolean, default: false
  end
end
