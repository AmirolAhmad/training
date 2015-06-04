class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :code
      t.integer :quantity
      t.integer :status

      t.timestamps null: false
    end
  end
end
