class CreateRentals < ActiveRecord::Migration
  def change
    create_table :rentals do |t|
      t.string :name
      t.string :manufacturer
      t.float :price
      t.string :image
      t.string :description

      t.timestamps
    end
  end
end
