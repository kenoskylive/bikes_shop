class CreateBookingItems < ActiveRecord::Migration
  def change
    create_table :booking_items do |t|
      t.references :booking, index: true
      t.references :rental, index: true
      t.integer :quantity

      t.timestamps
    end
  end
end
