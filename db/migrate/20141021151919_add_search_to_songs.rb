class AddSearchToSongs < ActiveRecord::Migration
  def change
    add_column :songs, :search, :string, default: "claptone"
  end
end
