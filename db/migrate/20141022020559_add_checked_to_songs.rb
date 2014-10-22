class AddCheckedToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :checked, :boolean, default: false
  end
end
