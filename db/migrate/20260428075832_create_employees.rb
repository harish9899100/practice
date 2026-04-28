class CreateEmployees < ActiveRecord::Migration[8.1]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.references :department, null: false, foreign_key: true
      t.references :position, null: false, foreign_key: true
      t.date :date_of_joining
      t.decimal :salary
      t.string :phone

      t.timestamps
    end
  end
end
