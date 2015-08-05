class CreateRentRequests < ActiveRecord::Migration
  def change
    create_table :rent_requests do |t|
      t.string :name
      t.string :email
      t.string :rent_type
      t.integer :rent_duration
      t.references :bike, index: true

      t.timestamps
    end
  end
end
