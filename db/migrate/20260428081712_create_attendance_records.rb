class CreateAttendanceRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :attendance_records do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :date
      t.datetime :clock_in_at
      t.datetime :clock_out_at
      t.text :notes

      t.timestamps
    end
  end
end
