class AddSearchToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :search, :string
  end
end
