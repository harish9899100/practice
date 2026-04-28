class CreatePayslips < ActiveRecord::Migration[8.1]
  def change
    create_table :payslips do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :period_month
      t.decimal :total_allowances
      t.decimal :total_deductions
      t.decimal :net_pay
      t.integer :status

      t.timestamps
    end
  end
end
