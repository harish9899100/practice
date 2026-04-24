class CreateProducts < ActiveRecord::Migration[8.1]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.integer :stock_count
      t.string :active

      t.timestamps
    end
  end
end
