class CreateBikes < ActiveRecord::Migration
  def change
    create_table :bikes do |t|
      t.string :bike_name
      t.float :price_per_day
      t.float :price_per_week
      t.text :descrition

      t.timestamps
    end
  end
end
