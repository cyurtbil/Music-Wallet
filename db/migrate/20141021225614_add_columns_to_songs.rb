class AddColumnsToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :track_id, :integer
  end
end
