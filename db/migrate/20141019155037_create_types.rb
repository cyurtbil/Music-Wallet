class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.belongs_to :wallet, index: true
      t.belongs_to :song, index: true
    end
  end
end
