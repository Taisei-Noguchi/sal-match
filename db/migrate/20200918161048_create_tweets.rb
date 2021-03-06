class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|
      t.string :title, null: false
      t.string :place, null: false
      t.string :address, null: false
      t.string :price, null: false
      t.string :item, null: false
      t.integer :category_id, null: false
      t.integer :field_id, null: false
      t.integer :level_id, null: false
      t.integer :month_id, null: false
      t.integer :day_id, null: false
      t.integer :hour_id, null: false
      t.references :user, null: false, foreign_key:true

      t.timestamps
    end
  end
end