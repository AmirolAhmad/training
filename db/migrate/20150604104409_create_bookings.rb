class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :item, index: true, foreign_key: true
      t.integer :quantity
      t.datetime :startdate
      t.datetime :enddate
      t.integer :status

      t.timestamps null: false
    end
  end
end
