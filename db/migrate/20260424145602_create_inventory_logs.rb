class CreateInventoryLogs < ActiveRecord::Migration[8.1]
  def change
    create_table :inventory_logs do |t|
      t.string :product
      t.integer :quantity_change
      t.text :reason

      t.timestamps
    end
  end
end
