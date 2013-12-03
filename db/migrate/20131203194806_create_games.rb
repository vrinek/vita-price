class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :psn_price
      t.integer :amazon_price
      t.string :title
      t.string :psn_id
      t.string :region

      t.timestamps
    end
  end
end
