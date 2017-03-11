class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :facebook_id
      t.integer :score, limit: 8
      t.timestamps
    end
  end
end
