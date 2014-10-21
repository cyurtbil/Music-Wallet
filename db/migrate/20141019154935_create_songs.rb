class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name, default: "claptone"
      t.belongs_to :user, index: true
    end
  end
end
