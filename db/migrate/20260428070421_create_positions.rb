class CreatePositions < ActiveRecord::Migration[8.1]
  def change
    create_table :positions do |t|
      t.string :title
      t.references :department, null: false, foreign_key: true
      t.integer :employee_type
      t.decimal :base_salary

      t.timestamps
    end
  end
end
